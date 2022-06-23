require 'rails_helper'
RSpec.describe Property, type: :model do
  let!(:task) { FactoryBot.create(:task) }
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
    it '郵便番号が７文字以下であること' do
      property.zip= '1' * 7
      expect(property).to be_valid
    end
    it '郵便番号が８文字以上の場合はエラーとなること' do
      property.zip= '1' * 8
      expect(property.valid?).to eq(false)
    end

    it '物件名が存在していること' do
      property.name = nil
      property.valid?
      expect(property.valid?).to eq(false)
    end
    it '電話番号が存在していること' do
      property.tel = nil
      property.valid?
      expect(property.valid?).to eq(false)
    end
    it '都道府県が存在していること' do
      property.prefecture = nil
      property.valid?
      expect(property.valid?).to eq(false)
    end
    it '市町村が存在していること' do
      property.city = nil
      property.valid?
      expect(property.valid?).to eq(false)
    end
    it '住所が存在していること' do
      property.address = nil
      property.valid?
      expect(property.valid?).to eq(false)
    end
end
