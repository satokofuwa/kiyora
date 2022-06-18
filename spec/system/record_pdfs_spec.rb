require 'rails_helper'
RSpec.describe "RecordPdfs", type: :system do
  let!(:task) { FactoryBot.create(:task) }
  let!(:user) { FactoryBot.create(:user) } 
  describe '請求書を表示させることができる' do
    context '請求書詳細画面' do
      it 'PDFを表示させることができる。画面の遷移ができる。' do
        sign_in user
        visit record_pdf_path(task.id)
        expect(current_path).to eq(record_pdf_path(task.id))
      end
    end
  end 
end
