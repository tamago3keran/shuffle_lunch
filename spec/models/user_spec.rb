require "rails_helper"

describe User do
  let(:user) { User.new(first_name: "test", last_name: "test") }

  it "is not valid without a first_name" do
    user.first_name = nil
    expect(user).not_to be_valid
  end

  it "is not valid without a last_name" do
    user.last_name = nil
    expect(user).not_to be_valid
  end
end
