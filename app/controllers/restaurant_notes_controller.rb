class RestaurantNotesController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_note = restaurant.restaurant_notes.build(restaurant_notes_params)
    if @restaurant_note.save
      flash[:notice] = "口コミを投稿しました"
    else
      flash[:error] = "口コミ投稿に失敗しました"
    end
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    restaurant_note = restaurant.restaurant_notes.find(params[:id])
    if restaurant_note.destroy
      flash[:notice] = "口コミを削除しました"
    else
      flash[:error] = "口コミの削除に失敗しました"
    end
    redirect_to restaurant_path(restaurant)
  end

  private
    def restaurant_notes_params
      params.require(:restaurant_note).permit(:writer_name, :comment)
    end
end
