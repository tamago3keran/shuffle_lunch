require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://example.com/", description: "") }
  let(:restaurant_note) { restaurant.restaurant_notes.create(writer_name: "testtest", comment: "http://hoge.test/test") }


#   describe "DELETE /restaurants/:restaurant_id/restaurant_notes/:id" do
  
#     it "redirects to restaurant index page" do
#       delete restaurant_path(restaurant, restaurant_note) params: { id: restaurant_note.id }
#       expect(response).to redirect_to restaurant
#     end
#   end
end
