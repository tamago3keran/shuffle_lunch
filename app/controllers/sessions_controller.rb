class SessionsController < ApplicationController
  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password])
      login(admin_user)
      flash[:notice] = "ログインしました"
      redirect_back_or root_url
    else
      flash.now[:error] = "ログインに失敗しました"
      render "new"
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
