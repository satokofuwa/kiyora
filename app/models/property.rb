class Property < ApplicationRecord
  belongs_to :task
  validates :zip, length: { maximum: 7 }   
  validates :name, presence: true
  validates :tel, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
end
