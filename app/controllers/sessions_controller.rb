class SessionsController < ApplicationController

  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password])
      log_in admin_user
      redirect_back(fallback_location: group_sets_path)
    else
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
