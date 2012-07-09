require 'spec_helper'

describe User do
  USER_DEFAULT_PARAMETERS = {
    provider: "twitter",
    uid: "37",
    name: "John Doe",
    email: "john.doe@gmail.com"
  }
  def new_user(params={})
    User.new(USER_DEFAULT_PARAMETERS.merge(params))
  end

  describe "validation" do
    it "should create a new instance" do
      user = new_user
      user.should be_valid
    end

    it "shouldn't create a new instance if provider is blank" do
      user = new_user(provider: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if uid is blank" do
      user = new_user(uid: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if name is blank" do
      user = new_user(name: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if email is blank" do
      user = new_user(email: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if provider and uid is unique" do
      user = new_user(provider: "twitter", uid: "37")
      user.save!

      user = new_user(provider: "twitter", uid: "37")
      user.should be_invalid
    end
  end
end