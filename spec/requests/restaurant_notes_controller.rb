require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://example.com/", description: "") }
  let(:restaurant_note_params) {
    { writer_name: "test_name", comment: "example" }
  }

  describe "DELETE /restaurants/:restaurant_id/restaurant_notes/:id" do
    
  end
end
