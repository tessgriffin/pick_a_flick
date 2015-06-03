class Movie < ActiveRecord::Base
  has_many :user_watchlists
  has_many :group_watchlist
end
