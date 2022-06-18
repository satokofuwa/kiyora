require 'rails_helper'
RSpec.describe Worker, type: :model do
  let!(:worker) { FactoryBot.build(:task) }
  

  describe 'Association' do
    let(:association) do
       described_class.reflect_on_association(target)
    end

    context 'tasks' do
      let(:target) { :tasks }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Task' }
    end
 
  end
end