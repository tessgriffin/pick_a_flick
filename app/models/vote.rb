class Vote < ActiveRecord::Base
  belongs_to :group_watchlist, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
