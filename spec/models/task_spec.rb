require 'rails_helper'
  RSpec.describe Task, type: :model do
    let!(:task) { FactoryBot.create(:task) }

    describe 'sum_of_sales'  do
      it "税金の金額になる" do
      expect(task.sum_of_sales.round).to eq 1980
      end
    end
   
    describe Task do
    it 'カラムに入力情報がある場合、有効である' do
      task = Task.new(
        id:  10001, 
        name: '定期建築設備点検',
        dispatch:  1, 
        content: '3年に1回',
        support_at: '2022/5/16',
        start_time: '2022-01-01 00:00:00',
        end_time:  '2022-01-01 00:00:00',
        category: 1,
        step: 2,
        sales_check: "確定",
        admin_check: "未承認",
        vehicle: 5,
        sales: '19800',
        confirmation: 0,
        user_id: 1,
        created_at:  '2022-01-01 00:00:00',
        updated_at:  '2022-01-01 00:00:00'
      )
      expect(task).to be_valid
    end
    
    before do
      @tasks = FactoryBot.build(:task)
    end

    it '作業名が必須であること' do
      @tasks.name = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
      #expect(@tasks.errors.full_messages).to include ("作業名を入力して下さい")
    end
      
    it '出動区分が必須であること' do
      @tasks.dispatch = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '作業予定日が必須であること' do
      @tasks.support_at = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '作業開始時間が必須であること' do
      @tasks.start_time = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '作業終了時間が必須であること' do
      @tasks.end_time = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '出動内容が必須であること' do
      @tasks.category = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '進捗情報が必須であること' do
      @tasks.step = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '売上確定チェックが必須であること' do
      @tasks.sales_check = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '承認チェックが必須であること' do
      @tasks.admin_check = nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '作業車両チェックが必須であること' do
      @tasks.vehicle= nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '売上金チェックが必須であること' do
      @tasks.sales= nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end

    it '作業確認連絡欄が必須であること' do
      @tasks.confirmation= nil
      @tasks.valid?
      expect(@tasks.valid?).to eq(false)
    end
  end

  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
    context 'agents' do
      let(:target) { :agents }
    it { expect(association.macro).to eq :has_many }
    it { expect(association.class_name).to eq 'Agent' }
    end
      context 'properties' do
        let(:target) { :properties }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Property' }
      end
      context 'front_managers' do
        let(:target) { :front_managers }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'FrontManager' }
      end 
      context 'partners' do
        let(:target) { :partners }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Partner' }
      end 
      context 'customers' do
        let(:target) { :customers }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Customer' }
      end 
      context 'workers' do
        let(:target) { :workers }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Worker' }
      end 
      context 'TaskPartners' do
        let(:target) { :task_partners }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'TaskPartner' }
      end 
      context 'task_workers' do
        let(:target) { :task_workers }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'TaskWorker' }
      end 
      context 'relationships' do
        let(:target) { :active_relationships }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Relationship' }
      end 
      context 'relationships' do
        let(:target) { :passive_relationships }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Relationship' }
      end 
      context 'relationships' do
        let(:target) { :followers }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'User' }
      end 
      context 'relationships' do
        let(:target) { :following }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'User' }
      end 
      context 'calims' do
        let(:target) { :claims }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Claim' }
      end 
      context 'invoices' do
        let(:target) { :invoices }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Invoice' }
      end 
    end
end

