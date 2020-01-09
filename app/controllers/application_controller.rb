class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  include SessionsHelper

  private
    def production?
      Rails.env.production?
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

    def logged_in_admin_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        store_location
        redirect_to login_url
      end
    end
end
