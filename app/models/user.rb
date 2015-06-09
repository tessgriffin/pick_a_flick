class User < ActiveRecord::Base
  has_many :user_watchlists
  has_many :user_groups
  has_many :movies, through: :user_watchlists
  has_many :groups, through: :user_groups

  validates :username, uniqueness: true

  def current_user?
    id?
  end

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.username = auth.info.nickname
    user.image_url = auth.info.image
    user.token = auth.credentials.token

    user.save

    user
  end
end
