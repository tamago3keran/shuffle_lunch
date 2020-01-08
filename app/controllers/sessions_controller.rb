class SessionsController < ApplicationController

  def new
  end

  def create
    adminuser = AdminUser.find_by(email: params[:session][:email].downcase)
    if adminuser && adminuser.authenticate(params[:session][:password])
      log_in adminuser
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
