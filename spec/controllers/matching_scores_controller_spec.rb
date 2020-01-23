require "rails_helper"

describe Users::MatchingScoresController do
  let(:user) { User.create(first_name: "test", last_name: "test") }

  describe "#index" do
    it "responds successfully" do
      get :index, params: { user_id: user.id }
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      get :index, params: { user_id: user.id }
      expect(response).to have_http_status "200"
    end
  end
end
