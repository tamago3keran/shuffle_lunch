require "rails_helper"

describe RestaurantNote do
  let(:restaurant_note) { RestaurantNote.new(comment: "test", writer_name: "example") }

  describe "writer_name" do
    it "is not valid without writer_name" do
      restaurant_note.writer_name = nil
      expect(restaurant_note).not_to be_valid
    end
  end

  describe "comment" do
    it "is not valid without comment" do
      restaurant_note.comment = nil
      expect(restaurant_note).not_to be_valid
    end

    context "when comment is more than 100 characters" do
      it "is not valid" do
        restaurant_note.comment = "a"*101
        expect(restaurant_note).not_to be_valid
      end
    end

    context "when comment is less than 100 characters" do
      it "is valid" do
        restaurant_note.comment = "a"*99
        expect(restaurant_note).to be_valid
      end
    end
  end
end
