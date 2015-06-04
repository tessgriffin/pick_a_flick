class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :group_watchlists
  has_many :movies, through: :group_watchlists

  validates :name, uniqueness: true, presence: true
end
