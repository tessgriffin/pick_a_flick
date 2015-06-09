class GroupWatchlist < ActiveRecord::Base
  belongs_to :movie
  belongs_to :group

  validates :group_id,  presence: true
  validates :movie_id, presence: true, uniqueness: true

  default_scope { order('ranking DESC') }
end
