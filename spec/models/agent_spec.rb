require 'rails_helper'
RSpec.describe Agent, type: :model do
  let!(:task) { FactoryBot.create(:task) }
  let!(:agent) { FactoryBot.create(:agent) }
 
end
