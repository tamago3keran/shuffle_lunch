class RestaurantNoteController < ApplicationController
  def create
    restaurant = Restaurant.find(params[:id])
    @restaurant_notes = restaurant.restaurant_notes.build(restaurant_notes_params)
    @restaurant_notes.save
  end

  private
    def restaurant_notes_params
      params.require(:restaurant_notes).permit(:writer_name, :comment)
    end
end