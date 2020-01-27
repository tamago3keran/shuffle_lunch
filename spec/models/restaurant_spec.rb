require "rails_helper"

describe Restaurant do
  let(:restaurant) { Restaurant.new(name: "test", url: "http://hoge.test/", description: "testtest") }

  it "is valid with a name, url and email, and description" do
    expect(restaurant).to be_valid
  end

  describe "#name" do

    it "is not valid without name" do
      restaurant.name = nil
      expect(restaurant).not_to be_valid
      expect(restaurant.errors[:name]).to include "can't be blank"
    end

    it "should have a unique name" do
      Restaurant.create(name: "test", url: "http://example.com", description: "")
      expect(restaurant).not_to be_valid
      expect(restaurant.errors[:name]).to include "is already taken"
    end
  end

  describe "#url" do

    it "is not valid without url" do
      restaurant.url = nil
      expect(restaurant).not_to be_valid
      expect(restaurant.errors[:url]).to include "can't be blank"
    end

    it "should have a unique url" do
      Restaurant.create(name: "test1", url: "http://hoge.test/", description: "")
      expect(restaurant).not_to be_valid
      expect(restaurant.errors[:url]).to include "is already taken"
    end

    context "when invalid format" do
      it "should be invalid" do
        invalid_url = %w[example, あ, Https://hoge.test/ ]
        invalid_url.each do |url|
          restaurant.url = url
          expect(restaurant).not_to be_valid
          expect(restaurant.errors[:url]).to include "is invalid"
        end
      end
    end

    context "when valid format" do
      it "should be valid" do
        valid_url = %w[http://example.com, http://hoge.test, http://example/hoge.com]
        valid_url.each do |url|
          restaurant.url = url
          expect(restaurant).to be_valid
        end
      end
    end
  end
end
