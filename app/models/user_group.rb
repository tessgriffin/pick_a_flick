class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  scope :active, ->   { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
