require 'rails_helper'
RSpec.describe Agent, type: :model do
  let!(:task) { FactoryBot.create(:task) }
  let!(:agent) { FactoryBot.create(:agent) }

  let(:association) do
    described_class.reflect_on_association(target)
  end
    context 'agents' do
      let(:target) { :task }
      it { expect(association.macro).to eq :belongs_to }
      it { expect(association.class_name).to eq 'Task' }
    end
 
    context 'ZIPは7文字以内であれば登録できる' do
      it "zipが7文字以内であれば登録できること" do
        zip = agent(zip: "1234567")
        expect(zip).to be_valid
      end
    end

    it 'ZIPは8文字以上であれば登録できない' do
      zip = agent(zip: "12345678") # 意図的に6文字のパスワードを設定してエラーが出るかをテスト 
      zip.valid?
      expect(zip.errors[:zip]).to include("7文字")
    end
end
