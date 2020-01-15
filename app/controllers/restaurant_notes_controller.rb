class RestaurantNotesController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_note = restaurant.restaurant_notes.new(restaurant_notes_params)
    if @restaurant_note.save
      flash[:notice] = "口コミを投稿しました"
      redirect_to restaurant_path(params[:restaurant_id])
    else
      flash[:error] = "口コミ投稿に失敗しました"
      redirect_to restaurant_path(params[:restaurant_id])
    end
  end

  private
    def restaurant_notes_params
      params.require(:restaurant_note).permit(:writer_name, :comment)
    end
end
