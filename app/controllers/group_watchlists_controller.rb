class GroupWatchlistsController < ApplicationController

  def create
    GroupWatchlist.create(group_id: params[:group_id], movie_id: params[:movie_id])
    redirect_to request.referrer
  end

end
