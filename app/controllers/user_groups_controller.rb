class UserGroupsController < ApplicationController

  def index
    @user_groups = current_user.user_groups
    @pending = current_user.user_groups.inactive
    @active = current_user.user_groups.active
  end

  def create
    user = User.find_by(email: params[:email])
    user_group = UserGroup.create(user_id: user.id, group_id: params[:id])
    flash[:danger] = user_group.errors.full_messages.join(", ") 
    redirect_to user_groups_path(user)
  end

  def pending
    @user_groups = current_user.user_groups.inactive
  end

  def update
    user_group = UserGroup.find_by(id: params[:id])
    user_group.update(active: params[:active])
    redirect_to :back
  end

  def destroy
    user_group = UserGroup.find_by(id: params[:id])
    user_group.destroy
    redirect_to :back
  end
end
