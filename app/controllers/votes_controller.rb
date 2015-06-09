class VotesController < ApplicationController

  before_action :verify_votes

  def upvote
    @vote = Vote.new(group_watchlist_id: params[:id], user_id: current_user.id, vote: "upvote")
    watchlist = GroupWatchlist.find_by(id: params[:id])
    ranking = watchlist.ranking
    new_ranking = ranking + 1
    group = Group.find_by(id: watchlist.group.id)
    if @vote.save
      session[:vote] = [] if session[:vote].nil?
      session[:vote] << @vote
      GroupWatchlist.update(watchlist, ranking: new_ranking)
      flash.now[:success] = "Vote Saved"
      redirect_to group_path(group)
    else
      flash.now[:danger] = @vote.errors.full_messages.join(", ")
      render "groups/show"
    end
  end

  def downvote
    @vote = Vote.new(group_watchlist_id: params[:id], user_id: current_user.id, vote: "downvote")
    watchlist = GroupWatchlist.find_by(id: params[:id])
    ranking = watchlist.ranking
    new_ranking = ranking - 1
    group = Group.find_by(id: watchlist.group.id)
    if @vote.save
      session[:vote] = [] if session[:vote].nil?
      session[:vote] << @vote
      GroupWatchlist.update(watchlist, ranking: new_ranking)
      flash.now[:success] = "Vote Saved"
      redirect_to group_path(group)
    else
      flash.now[:danger] = @vote.errors.full_messages.join(", ")
      render "groups/show"
    end
  end

end
