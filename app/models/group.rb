class Group < ActiveRecord::Base
  has_many :users
  has_many :group_watchlists
  has_many :movies, through: :group_watchlists

  validates :name, uniqueness: true, presence: true
end
