class HomeController < ApplicationController
  skip_before_action :authorize!

  def home
  end

  def search
    @user_watchlist = UserWatchlist.new
  end
end
