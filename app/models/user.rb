class User < ApplicationRecord
  attr_accessor :remember_token
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :activity_area, length: { maximum: 30 }
  validates :like_weapon, length: { maximum: 50 }
  
  class << self
    def digest(token)
      BCrypt::Password.create(token, cost: BCrypt::Engine.cost)
    end
  
    #ランダムなトークンを返す
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  #永続的にユーザーをDBに保存する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #トークンとダイジェストが一致するか確認
  def authenticated?(token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(token)
  end
  
  #ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
end
