require 'rails_helper'
RSpec.describe "Agents", type: :system do
  let!(:task) { FactoryBot.create(:task) } 
  let!(:agent) { FactoryBot.create(:agent) } 
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) } 

  describe 'ログインしている場合、管理会社一覧表示・更新.削除ができる' do
    context '管理会社一覧画面' do
      it '管理会社一覧ページに遷移し、更新画面に行くことができる' do
        sign_in user 
        visit agents_path
        expect(page).to have_content '管理会社一覧'
        first('.btn-outline-primary').click
        expect(page).to have_content '会社名'
      end
    end

    context '管理会社編集画面' do
      it '管理会社更新ページで更新ができる' do
        sign_in user 
        visit agents_path
        click_on '伝票更新'
        fill_in "agent[name]", with: '設備不動産'
        click_button '更新'
        expect(page).to have_content '更新しました'
      end
    end

    context 'ログインしていない場合' do
      it 'ログインしていない場合、画面遷移できない' do
          visit edit_agent_path(second_user.id)
          expect(page).to have_content 'Eメール'
      end
    end
    context '社員は削除することができない。' do
      it '一覧画面で、管理会社を削除することができる。' do
        sign_in second_user 
        visit agents_path
        expect(page).to have_no_content('削除')
      end
    end

    context '管理者は管理会社情報を削除することできる。' do
      it '一覧画面で、管理会社を削除することができる。' do
        sign_in user 
        visit agents_path
        first('.btn-outline-danger').click
        expect(page.driver.browser.switch_to.alert.text).to eq "削除してよろしいですか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'  
      end
    end
  end
end
