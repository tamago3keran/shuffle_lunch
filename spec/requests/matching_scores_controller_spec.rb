require "rails_helper"

describe Users::MatchingScoresController do
  let(:user) { User.create(first_name: "test", last_name: "test") }

  describe "GET /users/:id/matching_scores" do
    it "responds successfully" do
      get user_matching_scores_path(user), params: { user_id: user.id }
      expect(response).to be_successful
    end

    it "returns 200 OK" do
      get user_matching_scores_path(user), params: { user_id: user.id }
      expect(response).to have_http_status :ok
    end
  end
end
