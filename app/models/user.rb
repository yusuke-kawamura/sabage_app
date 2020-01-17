class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 30 }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :activity_area, length: { maximum: 30 }
  validates :like_weapon, length: { maximum: 50 }
end
