class UserWatchlistsController < ApplicationController

  respond_to :json

  def index
    @user_watchlists = current_user.user_watchlists
  end

  def create
    movie = Movie.find_or_create_by(imdb_id: params["imdb_id"], title: params["title"], poster_path: params["poster_path"])
    respond_with UserWatchlist.create(movie_id: movie.id, user_id: current_user.id), location: ""
  end

  def update
    if params["watched"] = "true"
      respond_with UserWatchlist.update(params["id"].to_i, watched: true ), location: ""
    else
      respond_with UserWatchlist.update(params["id"].to_i, watched: false ), location: ""
    end
  end

  def destroy
    UserWatchlist.destroy(params[:id].to_i)
    flash[:danger] = "Flick Removed From Watchlist"
    redirect_to user_watchlists_path
  end

end
