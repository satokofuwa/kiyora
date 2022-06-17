class RecordPdfsController < ApplicationController
  def show
    @records = Task.all # pdf上で使用するレコードのインスタンスを作成
    @record = Task.find(params[:id])
    @customers = Customer.all
    @customer = @customers.find_by(task_id: @record.id)

    respond_to do |format|
      format.html
      format.pdf do

        # pdfを新規作成。インスタンスを渡す。
        pdf = RecordPdf.new(@record, @customer)
        send_data pdf.render,
          filename:    "invoice.pdf",
          type:        "application/pdf",
          disposition: "inline" # 画面に表示。外すとダウンロードされる。
      end
    end
  end
  private
  def set_show
    params.permit(:name,:dispatch,
      properties_attributes:[:name, :zip, :prefecture, :city , :address, :tel,:_destroy ],
      partners_attributes:[{id:[]},:name,:worker,:contact,:sales,:_destroy],
      agents_attributes:[:id,:manager_name, :name, :zip, :prefecture, :city, :address,:_destroy],
      customer_attributes:[:id,:name,:zip,:address,:tel,:_destroy]
    )
  end
end