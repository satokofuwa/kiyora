require 'rails_helper'

RSpec.describe TaskWorker, type: :model do
  describe 'Association' do
    let(:association) do
       described_class.reflect_on_association(target)
    end

    context 'task' do
      let!(:task_worker) { FactoryBot.build(:task) }
      let(:target) { :task }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Task' }
    end
  end
end
