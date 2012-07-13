require 'spec_helper'

describe User do
  describe "validation" do
    it "should create a new instance" do
      user = build(:user)
      user.should be_valid
    end

    it "shouldn't create a new instance if provider is blank" do
      user = build(:user, provider: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if uid is blank" do
      user = build(:user, uid: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if name is blank" do
      user = build(:user, name: "")
      user.should be_invalid
    end

    it "shouldn't create a new instance if provider and uid is unique" do
      create(:user, provider: "twitter", uid: "37")

      user = build(:user, provider: "twitter", uid: "37")
      user.should be_invalid
    end
  end

  describe "class methods" do
    let(:params) do
      {
        "provider" => "twitter",
        "uid" => "37",
        "info" => {
          "name" => "John Doe"
        }
      }
    end

    describe "##find_with_omniauth!" do
      it "should create a new user if provider and uid isn't exist" do
        expect do
          User.find_or_create_with_omniauth!(params)
        end.should change(User, :count).from(0).to(1)
      end

      it "should return the user given provider and uid" do
        before = create(:user, provider: params['provider'], uid: params['uid'])
        after = User.find_or_create_with_omniauth!(params)

        before.should == after
      end
    end
  end

  describe "instance methods" do
    let(:params) do
      {
        "nickname" => "j.doe",
        "name" => "John Doe",
        "email" => "john.doe@gmail.com",
        "image" => "http://www.twitter.com/avatar.png"
      }
    end

    describe "#insert_omniauth_info" do
      it "should insert omniauth information" do
        user = build(:user)
        user.insert_omniauth_info(params)

        user.name.should == "John Doe"
        user.email.should == "john.doe@gmail.com"
        user.avatar.should == "http://www.twitter.com/avatar.png"
      end
    end
  end
end