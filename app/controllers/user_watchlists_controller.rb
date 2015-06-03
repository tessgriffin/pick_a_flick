class UserWatchlistsController < ApplicationController

  respond_to :json

  def create
    movie = Movie.find_or_create_by(imdb_id: params["imdb_id"], title: params["title"], poster_path: params["poster_path"])
    respond_with UserWatchlist.create(movie_id: movie.id, user_id: current_user.id)
  end

end
