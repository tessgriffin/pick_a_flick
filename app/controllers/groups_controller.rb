class GroupsController < ApplicationController
  before_action :ensure_group_member, only: [:show]
  before_action :ensure_active, only: [:show]

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      UserGroup.create(user_id: current_user.id, group_id: group.id, active: true)
      flash[:success] = "Group successfully created."
      redirect_to group_path(group.id)
    else
      flash.now[:danger] = group.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @group = Group.find_by!(id: params[:id])
    cache action: "show", action_suffix: "#{current_user.movies.last}" do
      @movies = current_user.movies
    end
    @group_watchlist = GroupWatchlist.new
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
