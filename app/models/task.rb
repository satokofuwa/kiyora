class Task < ApplicationRecord
  validates :name, presence: true
  validates :dispatch, presence: true
  validates :category, presence: true
  validates :support_at, presence: true
  validates :confirmation, presence: true
  validates :step, presence: true
  validates :vehicle, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :sales_check, presence: true
  validates :admin_check, presence: true
  validates :sales, presence: true
  
  has_many :agents, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :front_managers, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :claims, dependent: :destroy
  has_many :task_partners,dependent: :destroy
  has_many :partners, through: :task_partners, source: :partner
  has_many :task_workers, dependent: :destroy
  has_many :workers, through: :task_workers, source: :worker
  has_many :active_relationships, foreign_key: 'follower_id', class_name:'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name:'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed
  
  accepts_nested_attributes_for :agents, allow_destroy: true
  accepts_nested_attributes_for :properties, allow_destroy: true
  accepts_nested_attributes_for :front_managers, allow_destroy: true
  accepts_nested_attributes_for :workers, allow_destroy: true
  accepts_nested_attributes_for :invoices
  accepts_nested_attributes_for :customers,  allow_destroy: true
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :claims
  accepts_nested_attributes_for :partners,  allow_destroy: true
  accepts_nested_attributes_for :task_partners, allow_destroy: true
  accepts_nested_attributes_for :task_workers, allow_destroy: true
end
