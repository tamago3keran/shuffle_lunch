require "rails_helper"

describe UsersController do
  describe "#index" do
    it "responds successfully" do
      get users_path
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      get users_path
      expect(response).to have_http_status "200"
    end
  end
end
