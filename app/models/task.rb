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



  def sum_of_sales
    sales * 0.1
  end
  def check_user
    redirect_to tasks_path, notice: '伝票作成者以外はアクセスできません' if @task.user_id != current_user.id
  end
  
  def start_time
    self.support_at
  end
  
  enum category: {"消火器販売":0, "設備清掃":1, "排水管定期作業":2, "専有部排水不良":3, "共用設備点検":4, "駐車排水ピット清掃":5, "定期設備点検":6 ,"雨水桝清掃":7, "貯水槽清掃":8, "満水警報発報":9, "緊急出動":10, "消防設備定期点検":11, "特定建築物定期検査":12}
  enum dispatch: {"平日":0, "夜間":1, "緊急":2, "夜間緊急":3, "その他":4}
  enum confirmation: {"確認済": 0, "未確認": 1}
  enum step: {"起票":0, "日程連絡":1, "調整":2, "作業日決定":3, "お知らせ送付":4, "請求書発行":5, "送付":6, "売上":7}
  enum manager: { "有": 1, "無": 2}
  enum sales_check: {"未確定": 0, "確定": 1}
  enum admin_check: {"未承認": 0, "承認": 1}
  enum admin: { "管理者": true, "社員": false} 

end
