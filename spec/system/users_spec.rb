require 'rails_helper'
RSpec.describe "Users", type: :system do
  let!(:user) { FactoryBot.create(:user) } 
  let!(:second_user) { FactoryBot.create(:second_user) } 
    describe '社員はログインできる' do
      context 'ログイン画面' do
        it '社員はログイン出来る' do
          visit new_user_session_path
          fill_in "user[email]", with: 'admin@test.com'
          fill_in "user[password]", with: '1234567+A'
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました。'
        end
      end

      context 'ログイン画面' do
        it '社員以外はログイン出来ない' do
          visit new_user_session_path
          fill_in "user[email]", with: 'failure@test.com'
          fill_in "user[password]", with: '1234567+A'
          click_button 'ログイン'
          expect(page).to have_content 'Eメール'
        end
      end
    end
    
    describe '管理者アクセス制限テスト' do
      context '管理者は管理画面にアクセスできる' do   
        it '管理者専用ページに遷移しログアウトできる' do
          visit new_user_session_path
          fill_in "user[email]", with: 'admin@test.com'
          fill_in "user[password]", with: '1234567+A'
          click_button 'ログイン'
          visit rails_admin_path
          expect(page).to have_content 'サイト管理'
          click_on 'ホーム'
          expect(page).to have_content 'Kiyora'
        end
      end
      context '管理画面にアクセス出来ない' do   
        it '一般社員は管理画面に遷移出来ない' do
          visit new_user_session_path
          fill_in "user[email]", with: 'general@test.com'
          fill_in "user[password]", with: '1234567+A'
          click_button 'ログイン'
          visit rails_admin_path
          expect(page).to have_content 'アクセス権限がありません'
        end
      end
    end
    
   
    
    

end
