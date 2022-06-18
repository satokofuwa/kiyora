require 'rails_helper'
RSpec.describe "Customers", type: :system do
  let!(:task) { FactoryBot.create(:task) } 
  let!(:user) { FactoryBot.create(:user) } 
  let!(:customer) { FactoryBot.create(:customer) }
  describe '顧客情報表示させることができる' do
    context '顧客情報詳細画面' do
      it '詳細を表示することができる。画面の遷移ができる。' do
        sign_in user
        visit customer_path(customer.id)
        expect(page).to have_content '顧客情報'
      end
    end
  end 
  describe 'アクセス制限のテスト' do
    context 'ログインしていない場合' do
      it 'ログインしていない場合、画面遷移できない' do
          visit customer_path(customer.id)
          expect(page).to have_content 'Eメール'
      end
    end
  end
end
