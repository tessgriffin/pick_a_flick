class UsersController < ApplicationController
  def show
    @user_watchlists = current_user.user_watchlists
    @active_groups = current_user.user_groups.active
  end
end
