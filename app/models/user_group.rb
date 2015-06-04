class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :inactive, -> { where(active: false) }
end
