module SessionsHelper

  def log_in(admin_user)
    session[:adminuser_id] = admin_user.id
  end

  def current_admin_user
    if session[:adminuser_id]
      @current_admin_user ||= AdminUser.find(session[:adminuser_id])
    end
  end

  def logged_in?
    !current_admin_user.nil?
  end

  def log_out
    session.delete(:adminuser_id)
    @current_admin_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
