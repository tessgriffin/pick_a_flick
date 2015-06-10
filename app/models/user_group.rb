class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates_uniqueness_of :user_id, scope: :group_id, message: "Already Invited"

  scope :active, ->   { where(active: true) }
  scope :inactive, -> { where(active: false) }


end
