class Movie < ActiveRecord::Base
  has_many :user_watchlists
  has_many :group_watchlist

  validates :imdb_id, presence: true, uniqueness: true
  validates :title,   presence: true
end
