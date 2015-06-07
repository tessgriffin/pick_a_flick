class Vote < ActiveRecord::Base
  belongs_to :group_watchlist
  belongs_to :user
end
