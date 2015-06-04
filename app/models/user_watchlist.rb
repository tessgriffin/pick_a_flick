class UserWatchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :user_id,  presence: true
  validates :movie_id, presence: true, uniqueness: true
end
