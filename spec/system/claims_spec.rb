require 'rails_helper'
RSpec.describe "Claims", type: :system do
  let!(:task) { FactoryBot.create(:task) } 
  let!(:user) { FactoryBot.create(:user) } 
  let!(:second_user) { FactoryBot.create(:second_user) } 
  let!(:claim) { FactoryBot.create(:claim) } 
  describe 'クレーム情報一覧表示と編集' do
    context '一覧表示画面　更新画面' do
      it 'クレーム一覧画面に遷移できる。編集画面にアクセスできる' do
        sign_in user
        visit claims_path
        expect(page).to have_content 'クレーム情報一覧'
        visit edit_claim_path(claim.id)
        expect(page).to have_content '編集'
        select claim.id, from:'claim_task_id'
        fill_in 'claim_troubled_at',with: claim.troubled_at
        select claim.category, from:'claim_category'
        fill_in 'claim_content',with: claim.content
        fill_in 'claim_support_content',with: claim.support_content
        click_on '登録'
      end
    end
    context 'ログインしていない場合' do
      it 'ログインしていない場合、画面遷移できない' do
          visit properties_path
          expect(page).to have_content 'Eメール'
      end
    end
  end

  describe 'クレーム情報詳細表示' do
    context '詳細画面' do
      it '画面遷移が出来、詳細画面が表示される' do
        sign_in user
        visit claims_path
        click_on '詳細'
        expect(page).to have_content '発生日時'
      end
    end
  end
  describe 'クレーム情報新規作成' do
    context '一覧表示画面　新規作成画面' do
      it 'クレーム一覧画面に遷移できる。編集画面にアクセスできる' do
        sign_in user
        visit new_claim_path
        expect(page).to have_content '新規作成'
        select claim.id, from:'claim_task_id'
        fill_in 'claim_troubled_at',with: claim.troubled_at
        select claim.category, from:'claim_category'
        fill_in 'claim_content',with: claim.content
        fill_in 'claim_support_content',with: claim.support_content
        click_on '登録'
      end
    end
  end
  describe 'クレーム情報削除' do
    context '社員は削除することができない。' do
      it '一覧画面で、管理会社を削除することができる。' do
        sign_in second_user 
        visit claims_path
        expect(page).to have_no_content('削除')
      end
    end

    context '管理者は管理会社情報を削除することできる。' do
      it '一覧画面で、管理会社を削除することができる。' do
        sign_in user 
        visit claims_path
        first('.btn-outline-danger').click
        expect(page.driver.browser.switch_to.alert.text).to eq "削除してよろしいですか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'  
      end
    end
  end
  describe 'バリデーションのテスト' do
    context 'クレーム情報新規作成' do
      it 'クレーム情報に情報がなかった場合、Viewにエラーメッセージを出力' do
        sign_in user
        visit new_claim_path
        click_on '登録'
        expect(page).to have_content 'エラーがあります'  
      end
    end
    context 'クレーム情報新規作成' do
      it 'クレーム情報にバリデーション項目がなかった場合、Viewにエラーメッセージを出力' do
        sign_in user
        visit new_claim_path
        select claim.id, from:'claim[task_id]'
        click_on '登録'
        expect(page).to have_content 'エラーがあります'
      end
    end


  end
end
