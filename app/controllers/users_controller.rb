class UsersController < ApplicationController
  def show
    @user_watchlists = current_user.user_watchlists
  end
end
