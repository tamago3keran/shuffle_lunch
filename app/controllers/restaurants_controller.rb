class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.desc(:created_at).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "group_sets/groups" && path[:action] == "edit"
      session[:forwarding_url] = request.referrer
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "お店登録に成功しました！"
      redirect_back_or restaurants_path
    else
      flash[:error] = "お店登録に失敗しました！"
      redirect_back_or new_restaurant_path
    end
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :url, :description)
    end
end
