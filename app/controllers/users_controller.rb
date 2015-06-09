class UsersController < ApplicationController
  def show
    @user_watchlists = current_user.user_watchlists
    @active_groups = current_user.user_groups.active
  end

  def edit
    @user = User.find_by!(id: params[:id])
  end

  def update
    user = User.find_by!(id: params[:id])
    if user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Please try again"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone)
  end
end
