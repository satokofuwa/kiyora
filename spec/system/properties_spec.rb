require 'rails_helper'
RSpec.describe "Properties", type: :system do
  let!(:task) { FactoryBot.create(:task) } 
  let!(:property) { FactoryBot.create(:property) }
  let!(:user) { FactoryBot.create(:user) } 
  let!(:second_user) { FactoryBot.create(:second_user) } 
  describe '物件情報一覧表示と編集' do
    context '一覧表示画面　更新画面' do
      it '伝票を登録することができる。画面の遷移ができる。' do
        sign_in user
        visit properties_path
        expect(page).to have_content '物件一覧'
        visit edit_property_path(property.id)
       
        fill_in 'property[name]',with: property.name
        fill_in 'property[tel]',with: property.tel
        fill_in 'property[zip]',with: property.zip
        fill_in 'property[prefecture]',with: property.prefecture
        fill_in 'property[city]',with: property.city
        click_button '更新'
        expect(page).to have_content '更新しました'
      end
    end
    context 'ログインしていない場合' do
      it 'ログインしていない場合、画面遷移できない' do
          visit properties_path
          expect(page).to have_content 'Eメール'
      end
    end

  end

  describe '物件情報削除' do
    context '一覧画面' do
      it '社員は削除することができない' do
        sign_in second_user 
        visit properties_path
        expect(page).to have_no_content('削除')
      end
    end
    context '一覧画面' do
      it '管理者は削除することができる' do
        sign_in user 
        visit properties_path
        first('.btn-outline-danger').click
        expect(page.driver.browser.switch_to.alert.text).to eq "削除してよろしいですか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'  
      end
    end
  end
end

