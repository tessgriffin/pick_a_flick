class UserGroupsController < ApplicationController

  def index
    @user_groups = current_user.user_groups
    @pending = current_user.user_groups.inactive
    @active = current_user.user_groups.active
  end

  def create
    user = User.find_by(email: params[:email])
    UserGroup.create(user_id: user.id, group_id: params[:id])
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
  # def update
  #   if params[:active].empty?
  #     user_group = UserGroup.find_by(user_id: current_user.id, group_id: params[:id])
  #   else
  #     user_group = UserGroup.find_by(id: params[:id])
  #   end
  #   user_group.update(active: params[:active])
  #   redirect_to user_groups_path
  # end
  #
  # def destroy
  #   user_group = UserGroup.find_by(id: params[:id])
  #   user_group.destroy
  #   redirect_to :back
  # end
end
