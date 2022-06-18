# frozen_string_literal: true
require 'rails_helper'
RSpec.describe 'Tasks', type: :system do
  let!(:user) { FactoryBot.create(:user) } 
  let!(:second_user) { FactoryBot.create(:second_user) } 
  let!(:task) { FactoryBot.create(:task) } 
  let!(:second_task) { FactoryBot.create(:second_task) } 
  let!(:partner) { FactoryBot.create(:partner) } 
  let!(:worker) { FactoryBot.create(:worker) } 
  let!(:property) { FactoryBot.create(:property) } 
  let!(:customer) { FactoryBot.create(:customer) } 
  let!(:second_customer) { FactoryBot.create(:second_customer) } 

  describe '伝票登録機能と一覧表示' do
    context '伝票登録画面での登録' do
      it '伝票を登録することができる。画面の遷移ができる。' do
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

  describe '伝票登編集・詳細確認・削除ができる。' do
    context '伝票登録画面で登録' do
      it '伝票作成者は自分の伝票を編集することができる' do
        sign_in user 
        visit edit_task_path(task.id)
       # allow(helper).to receive(:current_user).and_return(user)
        select task.dispatch, from:'task[dispatch]'
        fill_in 'task[content]',with: task.content
        fill_in 'task_properties_attributes_0_name',with:property.name
        fill_in 'task_properties_attributes_0_tel',with:property.tel
        fill_in 'task_properties_attributes_0_zip',with:property.zip
        fill_in 'task_properties_attributes_0_prefecture',with:property.prefecture
        fill_in 'task_properties_attributes_0_city',with:property.city
        fill_in 'task_properties_attributes_0_address',with:property.address
        fill_in 'task_vehicle',with:task.vehicle
        fill_in 'task_name',with:task.name
        fill_in 'task_support_at',with:task.support_at
        fill_in 'task_start_time',with:task.start_time
        fill_in 'task_end_time',with:task.end_time
        select task.step, from:'task[step]'
        check 'task[sales_check]'
        check 'task[admin_check]'
        fill_in 'task[sales]',with: task.sales
        select task.confirmation ,from:'task[confirmation]'
        fill_in 'task[updated_at]',with: task.updated_at
        click_button '登録'
      end
    end

    context '伝票詳細画面' do
      it '詳細を確認することができる' do
        sign_in user 
        visit tasks_path
        first('.btn-outline-success').click
        expect(page).to have_content '伝票詳細'  
      end
    end

    context '伝票登録画面' do
      it '伝票を登録削除することができる' do
        sign_in user 
        visit tasks_path
        first('.btn-outline-danger').click
        expect(page.driver.browser.switch_to.alert.text).to eq "削除してよろしいですか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'  
      end
    end
  end

  describe '作成者以外は編集画面にアクセス出来ない' do
    context '伝票登録画面で登録' do
      it '伝票作成者は自分の伝票を編集することができる' do
        sign_in user 
        visit edit_task_path(second_task.id)
        expect(page).to have_content '伝票作成者以外はアクセスできません'
      end 
    end
  end
end
