module SessionsHelper
  def login(admin_user)
    session[:admin_user_id] = admin_user.id
  end

  def current_admin_user
    @current_admin_user ||= AdminUser.find(session[:admin_user_id]) if session[:admin_user_id]
  end

  def logged_in?
    !current_admin_user.nil?
  end

  def logout
    session.delete(:admin_user_id)
    @current_admin_user = nil
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
