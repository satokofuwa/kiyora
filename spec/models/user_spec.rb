require 'rails_helper'
RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.build(:task) }
 
  describe 'Association' do
    let(:association) do
       described_class.reflect_on_association(target)
    end
    context 'users' do
      let(:target) { :tasks }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Task' }
    end
    context 'users' do
      let(:target) { :active_relationships }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Relationship' }
    end

    context 'users' do
      let(:target) { :passive_relationships }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'Relationship' }
    end

    context 'users' do
      let(:target) { :followers }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'User' }
    end

    context 'users' do
      let(:target) { :following }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq 'User' }
    end
    
    describe "follow!,following?,unfollow!" do
      let(:other_user) { FactoryBot.create(:task) }
      before { user.following}
      describe "follow!" do
        it { expect(user.following).to be_truthy }
      end
      describe "following?" do
        it { expect(user.following).to be_truthy }
      end
      describe "unfollow!" do
        it { expect(user.following.destroy).to be nil }
      end
    end
  end
end
