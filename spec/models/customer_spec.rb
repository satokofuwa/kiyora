require 'rails_helper'

RSpec.describe Customer, type: :model do
  let!(:customer) { FactoryBot.build(:task) }
  describe 'Association' do
     Customer.new(
      id: 1,
      task_id: 10001,
      name: '山田太郎',
      zip:  '215-0000',
      prefecture: '神奈川県',
      address: '横浜市',
      tel:  '070-000-0000',
      room_number:'201',
      created_at: '2022-01-01 00:00:00',
      updated_at: '2022-01-01 00:00:00'
    )
  end

  let(:association) do
    described_class.reflect_on_association(target)
  end
    context 'customers' do
      let(:target) { :task }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Task' }
    end
end
