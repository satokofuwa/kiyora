require 'rails_helper'
RSpec.describe "Workers", type: :system do
  let!(:user) { FactoryBot.create(:user) } 
  let!(:task) { FactoryBot.create(:task) } 
  let!(:partner) { FactoryBot.create(:partner) } 
  let!(:worker) { FactoryBot.create(:worker) } 

  describe '作業員を新規伝票作成で登録できる' do
    context '伝票登録画面' do
      it '作業員の情報を伝票に登録することができる。' do
        visit new_user_session_path
        fill_in "user[email]", with: 'admin@test.com'
        fill_in "user[password]", with: '1234567+A'
        click_button 'ログイン'
        visit new_task_path
        fill_in 'task_partners_attributes_0_worker',with: partner.worker
        fill_in 'task_partners_attributes_0_name',with: partner.name
        fill_in 'task_partners_attributes_0_contact',with: partner.contact
        fill_in 'task_partners_attributes_0_sales',with: partner.sales
        select task.dispatch, from:'task[dispatch]'
        fill_in 'task_workers_attributes_0_name',with: worker.name
        fill_in 'task[content]',with: task.content
        fill_in 'task[support_at]',with: task.support_at
        fill_in 'task[start_time]',with: task.start_time
        fill_in 'task[end_time]',with: task.end_time
        select task.category, from:'task[category]'
        select task.step, from:'task[step]'
        check 'task[sales_check]'
        check 'task[admin_check]'
        fill_in 'task[vehicle]',with: task.vehicle
        fill_in 'task[sales]',with: task.sales
        select task.confirmation ,from:'task[confirmation]'
        click_button '登録'
        visit tasks_path
        expect(page).to have_content '定期建築設備点検'
      end
    end
  end
end
