class SessionsController < ApplicationController

  skip_before_action :authorize!

  def create
    @user = User.find_or_create_by_auth(auth)

    if @user && auth.provider == "twitter"
      session[:user_id] = @user.id
      flash.now[:success] = "You successfully logged in. Please fill in your Email and Phone number for full site functionality."
      redirect_to @user
    elsif @user && auth.provider == "github"
      session[:user_id] = @user.id
      redirect_to @user, success: "You successfully logged in. Please fill in your Phone number for full site functionality."
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def new
  end

  def destroy
    session.clear
    redirect_to root_path, danger: "You successfully logged out."
  end


  private

  def auth
    request.env["omniauth.auth"]
  end
end
