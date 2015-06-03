class Movie < ActiveRecord::Base
  has_many :user_watchlists
end
