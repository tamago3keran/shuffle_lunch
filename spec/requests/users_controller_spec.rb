require "rails_helper"

describe UsersController do
  describe "GET /users" do
    it "responds successfully" do
      get users_path
      expect(response).to be_successful
    end

    it "returns 200 OK" do
      get users_path
      expect(response).to have_http_status :ok
    end
  end
end
