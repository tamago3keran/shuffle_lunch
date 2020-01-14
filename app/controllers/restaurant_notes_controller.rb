class RestaurantNotesController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_note = restaurant.restaurant_notes.new(restaurant_notes_params)
    @restaurant_note.save
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private
    def restaurant_notes_params
      params.require(:restaurant_note).permit(:writer_name, :comment)
    end
end
