class Customer < ApplicationRecord
  belongs_to :task
  validates :name, presence: true
  validates :room_number, numericality: { only_integer: true }
  validates :tel, presence: true
  validates :tel, numericality: { only_integer: true }
  validates :zip, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed? 
end
