module SessionsHelper

  def log_in(adminuser)
    session[:adminuser_id] = adminuser.id
  end

  def current_adminuser
    if session[:adminuser_id]
      @current_adminuser ||= AdminUser.find(session[:adminuser_id])
    end
  end

  def logged_in?
    !current_adminuser.nil?
  end

  def log_out
    session.delete(:adminuser_id)
    @current_adminuser = nil
  end
end
