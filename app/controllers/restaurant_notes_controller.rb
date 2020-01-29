class RestaurantNotesController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_note = restaurant.restaurant_notes.build(restaurant_notes_params)
    if @restaurant_note.save
      flash[:notice] = "口コミを投稿しました"
    else
      flash[:error] = "口コミ投稿に失敗しました"
      flash[:danger] = "#{@restaurant_note.errors.full_messages.join}"
    end
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private
    def restaurant_notes_params
      params.require(:restaurant_note).permit(:writer_name, :comment)
    end
end
