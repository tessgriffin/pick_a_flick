class User < ActiveRecord::Base
  has_many :user_watchlists
  has_many :group_watchlists
  has_many :movies, through: :user_watchlists

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :phone, uniqueness: true

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.username = auth.info.nickname
    user.image_url = auth.info.image
    user.token = auth.credentials.token

    user.save

    user
  end
end
