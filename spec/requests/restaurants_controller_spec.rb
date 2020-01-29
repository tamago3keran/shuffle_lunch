require "rails_helper"

describe RestaurantsController do
  describe "#index" do
    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end
  end
end
