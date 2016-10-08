require 'rails_helper'


RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
      name: "jonathan",
      password: "good_password")
  end

  # validations
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should ensure_length_of(:password).is_at_least(6)}

  describe "associations" do
    # associations
    it { should have_many(:subs) }
    it { should have_many(:votes) }
    it { should have_many(:comments) }
  end

  describe "User#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies a password is incorrect" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe "User#reset_session_token" do
    it "sets a new session_token for a user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe ".find_by_credentials" do
    it "returns a user with correct username and password" do
      expect(user.find_by_credentials("jonathan","good_password")).to eq(user)
    end

    it "returns nil with incorrect username or password" do
      expect(user.find_by_credentials("susie","good_password")). to eq(nil)
    end
  end
end
