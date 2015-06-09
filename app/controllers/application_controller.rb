class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize!

  helper_method :current_user, :ensure_group_member, :ensure_active

  def current_user
    @current_user ||= User.find_by(id: session[:user_id] )
  end

  def current_group
    @current_group ||= Group.find_by(id: params[:id])
  end

  def ensure_group_member
    group = Group.find(params[:id])
    unless group.in?(current_user.groups)
      redirect_to user_path(current_user)
    end
  end

  def ensure_active
    unless UserGroup.find_by!(user_id: current_user.id, group_id: current_group.id).active?
      flash[:danger] = "Must be active member to access this page."
      redirect_to user_path(current_user)
    end
  end

  def authorize!
    unless allow?
      Permissions.new(current_user).allow?(params[:controller], params[:action], params[:id])
      redirect_to root_path, danger: "Invalid option."
    end
  end

  def allow?
    current_permission.allow?(params[:controller], params[:action], params[:id])
  end

  def current_permission
    @current_permission ||= Permissions.new(current_user)
  end
end
