class Users::ActivationsController < ApplicationController
  before_action :load_resource

  def update
    if @user.update_attributes(active: true)
      redirect_to root_path, flash: { notice: "ユーザの有効化に成功しました!" }
    else
      redirect_to root_path, flash: { notice: "ユーザの有効化に失敗しました!" }
    end
  end

  def destroy
    if @user.update_attributes(active: false)
      redirect_to root_path, flash: { notice: "ユーザの無効化に成功しました!" }
    else
      redirect_to root_path, flash: { notice: "ユーザの無効化に失敗しました!" }
    end
  end

  private
    def load_resource
      case params[:action].to_sym
      when :update, :destroy
        @user = User.find(params[:user_id])
      end
    end
end
