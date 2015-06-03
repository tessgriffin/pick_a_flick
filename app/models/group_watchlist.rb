class GroupWatchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :group_id,  presence: true
  validates :movie_id, presence: true
end
