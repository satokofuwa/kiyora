require 'rails_helper'
  RSpec.describe "Relationships", type: :system do
    let!(:user) { FactoryBot.create(:user) } 
      describe 'フォロー、フォロー削除できる' do
        context 'フォロー画面' do
          it 'フォロー登録ができる。' do
            sign_in(user)
            visit users_path(user)
            find('input[name="commit"]').click
            visit users_path(user)
            expect(page).to have_selector '.btn-funky-moon'
            visit users_path(user)
            find('input[name="commit"]').click
            visit users_path(user)
            expect(page).to have_selector '.btn-dark-blue'
          end
        end
      end      
  end
