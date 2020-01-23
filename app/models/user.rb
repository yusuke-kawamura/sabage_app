class User < ApplicationRecord
  attr_accessor :remember_token
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :activity_area, length: { maximum: 30 }
  validates :like_weapon, length: { maximum: 50 }
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  #永続的にユーザーをDBに保存する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #トークンとダイジェストが一致するか確認
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::password.new(remember_digest).is_password?(remember_token)
  end
  
  #ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
end
