require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://hoge.test/", description: "") }
  let(:restaurant_note_params) {
    { writer_name: "test_name", comment: "example" }
  }


  describe "create" do
    it "redirects to restaurant show page" do
      post :create, params: {restaurant_id: restaurant.id, restaurant_note: restaurant_note_params}
      expect(response).to redirect_to restaurant_path(restaurant)
    end

    it "creates a new Restaurant note" do
      expect {
        post :create, params: { restaurant_id: restaurant.id, restaurant_note: restaurant_note_params }
      }.to change(restaurant.restaurant_notes, :count).by(1)
    end
  end
end

# context “with valid params” do
#   it “creates a new Restaurant” do
#     expect {
#       post :create, params: { restaurant: valid_attributes }
#     }.to change(Restaurant, :count).by(1)
#   end
#   it “redirects to the restaurant index page” do
#     post :create, params: { restaurant: valid_attributes }
#     expect(response).to redirect_to restaurants_path
#   end
# end
