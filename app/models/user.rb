class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: %i(google)
  has_many :tasks
  has_many :active_relationships, foreign_key: 'follower_id', class_name:'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name:'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed
  
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  #フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy   
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com',uid: 13, provider:13) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = false
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  def self.admin_guest
    find_or_create_by!(email: 'guest_admin@example.com',uid: 14, provider:14) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
  
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
  
    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                   )
    end
    user.save
    user
  end
end
