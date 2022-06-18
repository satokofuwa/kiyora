require 'rails_helper'
RSpec.describe Partner, type: :model do
  let!(:partner) { FactoryBot.build(:task) }
 
  describe 'Association' do
    let(:association) do
       described_class.reflect_on_association(target)
    end

    context 'tasks' do
      let(:target) { :tasks }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Task' }
    end
   
  describe 'validation' do
    it 'パートナーがある場合、有効である' do
      expect(partner).to be_valid
    end

    it "会社名がない場合、無効であること" do
      partner.name = nil
      expect(partner).to be_invalid
      expect(partner.errors[:name]).to include("を入力してください")
    end
  end
    

 
  end
end
