class Movie < ActiveRecord::Base
  has_many :user_watchlists, dependent: :destroy
  has_many :group_watchlists, dependent: :destroy

  validates :imdb_id, presence: true, uniqueness: true
  validates :title,   presence: true
end
