class RestaurantNotesController < ApplicationController
  def create
    restaurant = Restaurant.find("5e16c49e9f880b8e21012e6f")
    @restaurant_note = restaurant.restaurant_notes.new(restaurant_notes_params)
    @restaurant_note.save
    redirect_to restaurant_path("5e16c49e9f880b8e21012e6f")
  end

  private
    def restaurant_notes_params
      params.require(:restaurant_note).permit(:writer_name, :comment)
    end
end