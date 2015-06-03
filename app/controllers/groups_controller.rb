class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      flash.now[:success] = "Group successfully created."
      redirect_to group_path(group.id)
    else
      flash.now[:danger] = group.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @movies = current_user.movies
    @group_watchlist = GroupWatchlist.new
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
