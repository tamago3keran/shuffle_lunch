require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://example.com/", description: "") }
  let(:restaurant_note_params) {
    { writer_name: "test_name", comment: "example" }
  }

  describe "create" do
    it "redirects to restaurant show page" do
      post restaurant_restaurant_notes_path(restaurant), params: { restaurant_id: restaurant.id, restaurant_note: restaurant_note_params }
      expect(response).to redirect_to restaurant_path(restaurant)
    end

    it "creates a new Restaurant note" do
      expect {
        post restaurant_restaurant_notes_path(restaurant), params: { restaurant_id: restaurant.id, restaurant_note: restaurant_note_params }
      }.to change { Restaurant.find(restaurant.id).restaurant_notes.count }.by(1)
    end
  end
end
