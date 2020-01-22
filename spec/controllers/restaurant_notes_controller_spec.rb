require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://hoge.test/", description: "") }
  let(:restaurant_note_params) {
    { writer_name: "test_name", comment: "example" }
  }


  describe "create" do
    it "redirects to restaurant show page" do
      post restaurant_restaurant_notes_path(restaurant), params: {restaurant: {restaurant_note: restaurant_note_params}}
      expect(response).to be_successful
    end
  end
end
