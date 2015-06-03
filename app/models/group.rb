class Group < ActiveRecord::Base
  has_many :users
  has_many :movies, through: :group_movielist

  validates :name, uniqueness: true, presence: true
end
