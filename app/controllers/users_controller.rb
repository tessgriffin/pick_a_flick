class UsersController < ApplicationController
  def show
    @movies = current_user.movies
  end
end
