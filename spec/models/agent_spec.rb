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
        @agent = Agent.new(
          zip: "1234567"
        )
        expect(agent).to be_valid
      end
    end

    it 'ZIPは8文字以上であれば登録できない' do
      @agent = Agent.new(
        zip: "12345678"
      ) 
      expect(@agent.valid?).to eq(false)
    end
end
