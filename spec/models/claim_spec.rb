require 'rails_helper'

RSpec.describe Claim, type: :model do
  let!(:task) { FactoryBot.create(:task) }
  describe Claim do
    it '日時が過去の場合は有効である' do
      claim = Claim.new(
        id: 1,
        task_id: 1,
        troubled_at: '2022-01-01 00:00:00',
        category:'要対応',
        content:'クレームあり',
        support_content:'前回の続きの作業を行う',
        created_at:'2022-01-01 00:00:00',
        updated_at:'2022-01-01 00:00:00'
         )
      expect(claim).to be_valid
    end
    it '日時が今日の場合は有効である' do
      claim = Claim.new(
        id: 1,
        task_id: 1,
        troubled_at: Date.today,
        category:'要対応',
        content:'クレームあり',
        support_content:'前回の続きの作業を行う',
        created_at:'2022-01-01 00:00:00',
        updated_at:'2022-01-01 00:00:00'
         )
      expect(claim).to be_valid
    end
    it '日時が明日場合は無効である' do
      claim = Claim.new(
        id: 1,
        task_id: 1,
        troubled_at: Date.today + 1,
        category:'要対応',
        content:'クレームあり',
        support_content:'前回の続きの作業を行う',
        created_at:'2022-01-01 00:00:00',
        updated_at:'2022-01-01 00:00:00'
         )
      expect(claim).to be_invalid
    end

  end
end

