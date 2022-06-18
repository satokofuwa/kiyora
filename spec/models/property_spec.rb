require 'rails_helper'
RSpec.describe Property, type: :model do
  let!(:property) { FactoryBot.build(:property) }
  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end
      context 'properties' do
        let(:target) { :task }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Task' }
      end
    end
end
