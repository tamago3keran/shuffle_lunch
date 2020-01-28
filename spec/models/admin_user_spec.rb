require "rails_helper"

describe AdminUser do
  let(:admin_user) { AdminUser.new(
    first_name: "test",
    last_name: "rspec",
    email: "test@example.com",
    password: "password") }

  it "is valid with a first name, last name and email, and password" do
    expect(admin_user).to be_valid
  end

  describe "#name" do
    it "is not valid without a first_name" do
      admin_user.first_name = nil
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:first_name]).to include "can't be blank"
    end

    it "is not valid with a first_name that less than 21 characters" do
      admin_user.first_name = "a" * 21
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:first_name]).to include "is too long (maximum is 20 characters)"
    end

    it "is not valid without a last_name" do
      admin_user.last_name = nil
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:last_name]).to include "can't be blank"
    end

    it "is not valid with a last_name that less than 21 characters" do
      admin_user.last_name = "a" * 21
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:last_name]).to include "is too long (maximum is 20 characters)"
    end
  end

  describe "#email" do
    it "is not valid without a email" do
      admin_user.email = nil
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:email]).to include "can't be blank"
    end

    it "is not valid with an email that has less than 256 characters" do
      admin_user.email = "a" * 244 + "@example.com"
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:email]).to include "is too long (maximum is 255 characters)"
    end

    it "is not valid without an email based on format" do
      admin_user.email = "a@a"
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:email]).to include "is invalid"
    end

    it "is not valid with a duplicate email" do
      AdminUser.create(
        first_name: "test",
        last_name:  "rspec",
        email:      "test@example.com",
        password:   "password",
      )
      admin_user.email = "test@example.com"
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:email]).to include "is already taken"
    end
  end

  describe "#password" do
    it "is not valid without a password" do
      admin_user.password = nil
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:password]).to include "can't be blank"
    end

    it "is not valid with a password that more than 5 characters" do
      admin_user.password = "a" * 5
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:password]).to include "is too short (minimum is 6 characters)"
    end
  end

  describe "#full_name" do
    it "returns full name" do
      admin_user.first_name = "test"
      admin_user.last_name = "rspec"
      expect(admin_user.full_name).to eq "test rspec"
    end
  end
end
