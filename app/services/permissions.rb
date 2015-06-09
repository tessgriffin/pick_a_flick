class Permissions
  attr_reader :user,
              :controller,
              :action

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action, group_id=nil)
    @controller = controller
    @action = action
    if user.current_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

  private

  def registered_user_permissions
    return true if controller == "sessions"
    return true if controller == "group_watchlists"
    return true if controller == "groups"
    return true if controller == "home"
    return true if controller == "movies"
    return true if controller == "user_groups"
    return true if controller == "user_watchlists"
    return true if controller == "users"
    return true if controller == "votes"
  end

  def guest_user_permissions
    return true if controller == "home"
    return true if controller == "sessions"
    return true if controller == "movies"
  end

end
