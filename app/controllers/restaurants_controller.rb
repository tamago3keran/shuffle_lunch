class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.desc(:created_at).page(params[:page]).per(10)
  end

  def show

  end
end
