class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:notice] = "ログインしています"
      redirect_to admin_group_sets_path
    end
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password])
      login(admin_user)
      flash[:notice] = "ログインしました"
      redirect_back_or admin_group_sets_path
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
