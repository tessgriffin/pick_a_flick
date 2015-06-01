class SessionsController < ApplicationController

  def create
    User.find_or_create_by_auth(auth)
    
  end

  def new
  end


  private

  def auth
    request.env["omniauth.auth"]
  end
end
