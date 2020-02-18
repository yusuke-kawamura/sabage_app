class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  belongs_to :user, foreign_key: 'group_creator_id'
  validates :name, presence: true, uniqueness: true
end
