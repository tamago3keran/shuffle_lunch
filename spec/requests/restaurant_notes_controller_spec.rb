require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://example.com/", description: "") }
  let!(:restaurant_note) { restaurant.restaurant_notes.create(writer_name: "testtest", comment: "example") }


  describe "DELETE /restaurants/:restaurant_id/restaurant_notes/:id" do

    it "destroys the required restaurant note" do
      expect {
        delete(restaurant_restaurant_note_path(restaurant, restaurant_note))
      }.to change { restaurant.reload.restaurant_notes.count }.by(-1)
    end

    it "redirects to restaurant index page" do
      delete restaurant_restaurant_note_path(restaurant, restaurant_note)
      expect(response).to redirect_to restaurant_path(restaurant)
    end
  end
end
