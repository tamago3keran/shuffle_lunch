require "rails_helper"

describe RestaurantNotesController do
  let(:restaurant) { Restaurant.create(name: "test", url: "http://example.com/", description: "") }
  let(:restaurant_note) { restaurant.restaurant_notes.create(writer_name: "example_name", comment: "testtesttest") }
  let(:valid_attributes) {
    { writer_name: "test1", comment: "a"*99 }
  }
  let(:invalid_attributes) {
    { writer_name: "test1", comment: "a"*101 }
  }

  describe "GET /restaurants/:restaurant_id/restaurant_notes/:id/edit" do
    it "responses successfully" do
      get edit_restaurant_restaurant_note_path(restaurant, restaurant_note), params: { restaurant_id: restaurant.id, id: restaurant_note.id }
      expect(response).to be_successful
    end

    it "returns 200 OK" do
      get edit_restaurant_restaurant_note_path(restaurant, restaurant_note), params: { restaurant_id: restaurant.id, id: restaurant_note.id }
      expect(response).to have_http_status :ok
    end
  end

  describe "PUT /restaurants/:restaurant_id/restaurant_notes/:id" do
    context "with valid params" do
      it "updates the required restaurant note" do
        put restaurant_restaurant_note_path(restaurant, restaurant_note), params: { restaurant_note: valid_attributes }
        restaurant.reload
        expect(restaurant.restaurant_notes.comment).to eq(valid_attributes[:comment])
      end

      it "redirect to restaurant show page" do
        put restaurant_restaurant_note_path(restaurant, restaurant_note), params: { restaurant_note: valid_attributes }
        expect(response).to redirect_to(restaurant)
      end
    end
  end
end

# バリデーショnが追加されてから実装したいためコメントアウト
    # context "with invalid params" do
    #   it "does not update the required restaurant note" do
    #     put restaurant_path(restaurant), params: {id: restaurant.id, restaurant: invalid_attributes}
    #     restaurant.reload
    #     expect(restaruant.url).not_to eq(inavalid_attributes[:url])
    #   end

    #   it "render edit template" do
    #     expect(response).to render_template :edit
    #   end
    # end
