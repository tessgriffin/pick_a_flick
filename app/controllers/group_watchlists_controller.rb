class GroupWatchlistsController < ApplicationController

  def create
    params[:group][:movie_ids].each do |movie_id|
      GroupWatchlist.create(group_id: params[:group_id], movie_id: movie_id)
    end
    redirect_to request.referrer
  end

end
