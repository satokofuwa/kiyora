
class RecordPdf < Prawn::Document
  FONT_PATH = Rails.root + '/Users/satokofuwa/workspace/kiyora/app/assets/fonts/ipaexg.ttf'

  def initialize(record,customer)

    super(
      page_size: 'A4',
      top_margin: 40,
      bottom_margin: 30,
      left_margin: 20,
      right_margin: 20
    )

    @record = record
    @customer = customer
   
    font 'app/assets/fonts/ipaexg.ttf'
  
    #stroke_axis

    # 下記で作成したコンポーネントを表示順に
    header
    move_down 50
    contents
  end

  # コンポーネント作成
  def header
    text '請求書', size: 20, align: :center
    move_down 20

    text "作成日: #{Date.today}",align: :right, size: 10
    text "株式会社　良好建築設備",align: :right, size: 10
    text "住所　東京都台東区花川戸3丁目1-1-1",align: :right, size: 10
    text "電話: 03-333-3333",align: :right, size: 10
    text "info: contact@center.com",align: :right, size: 10
    image 'app/assets/images/sqe_rei.jpeg',align: :right, width: 40, height: 40,at: [400, 700]
    
    text "#{@customer.name} 様",align: :left, size: 12
    text "郵便番号: #{@customer.zip} ",align: :left, size: 12
    text "住所: #{@customer.address} ",align: :left, size: 12
  end

  def contents
    move_down 10
    text "作業日:#{@record.support_at.strftime("%Y年%m月%d日").to_s}"
    text '下記の通りご請求申し上げます。',align: :center
 
      bounding_box([0, 555], width: 310, height: 65) do
       move_down 10
      text "合計金額 #{@record.sales+(@record.sales*0.1).round}", size: 16, align: :left
      end

      rows = [['詳細', '数量', '単価', '金額'], 
      ["#{@record.category}", '1',"#{@record.sales}", "#{@record.sales+(@record.sales*0.1).round}"]
      ]

      table(rows, column_widths: [370, 30, 60, 60], position: :center) do |table|
      # セルのサイズの指定
      table.cells.size = 10
      # 1行目のalignを真ん中寄せにしている
      table.row(0).align = :center
      end

      bounding_box([373, 300], width: 150, height: 100) do
        table [['小計', "#{@record.sales}"], ['消費税', "#{(@record.sales*0.1).round}"], 
        ['合計金額', "#{@record.sales+(@record.sales*0.1).round}"]],
        column_widths: [50, 100], position: :right do |table|
        table.cells.size = 10
        end
      move_down 10
      text "お振込期日  #{Date.today+14}", size: 12, align: :left
      end
  end
end 