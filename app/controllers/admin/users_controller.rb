class Admin::UsersController < ApplicationController
  before_action :load_resource, only: [:index, :new]

  def index; end

  def new; end

  def create
    user = CreateUserService.call(user_params)
    if user.present?
      redirect_to admin_users_path, flash: { notice: "ユーザ作成に成功しました!" }
    else
      redirect_to new_admin_user_path, flash: { error: "ユーザ作成に失敗しました!" }
    end
  end

  private
    def load_resource
      case params[:action].to_sym
      when :index
        @users = User.all
      when :new
        @user = User.new
      end
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
