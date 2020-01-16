class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.desc(:created_at).page(params[:page]).per(10)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_notes = @restaurant.restaurant_notes.all.desc(:created_at).page(params[:page]).per(6)
  end

  def new
    @restaurant = Restaurant.new
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    if restaurant.destroy
      flash[:notice] = "お店を削除しました"
      redirect_to restaurants_path
    else
      flash.now[:error] = "お店の削除に失敗しました"
      render :show
    end
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "お店登録に成功しました！"
      redirect_to restaurants_path
    else
      flash[:error] = "お店登録に失敗しました！"
      redirect_to new_restaurant_path
    end
  end

  def edit 
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:notice] = "お店情報を更新しました"
      redirect_to @restaurant
    else
      flash.now[:notice] = "お店の編集に失敗しました"
      render 'edit'
    end
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :url, :description)
    end
end
