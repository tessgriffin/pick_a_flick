class SessionsController < ApplicationController

  skip_before_action :authorize!

  def create
    user = User.find_or_create_by_auth(auth)

    if !user.id.nil? && auth.provider == "twitter"
      session[:user_id] = user.id
      if user.email.nil?
        flash[:danger] = "Enter a valid email address"
        redirect_to edit_user_path(user)
      else
        flash.now[:success] = "You successfully logged in. Please fill in your Email and Phone number for full site functionality."
        redirect_to user_path(user)
      end
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
