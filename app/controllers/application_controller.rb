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

    def require_admin_login
      unless logged_in?
        flash[:danger] = "ログインしてください"
        store_location
        redirect_to login_url
      end
    end

    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
end
