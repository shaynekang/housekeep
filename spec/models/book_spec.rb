require 'spec_helper'

describe Book do
  describe "'s validation" do
    it "should create a new instance" do
      book = build(:book)
      raise book.errors.inspect if book.invalid?
      book.should be_valid
    end

    it "shouldn't create a new instance if title is blank" do
      book = build(:book, title: "")
      book.should be_invalid
    end

    it "shouldn't create a new instance if no user" do
      book = build(:book, user: nil)
      book.should be_invalid
    end

    it "shouldn't create a new instance if title isn't unique" do
      user = create(:user)
      alice1 = build(:book, user: user)
      alice2 = build(:book, user: user)

      alice1.save!
      alice2.should be_invalid
    end

    it "should create a new instance if title is unique per user" do
      john = create(:user, :john)
      park = create(:user, :park)

      alice1 = build(:book, user: john)
      alice2 = build(:book, user: park)

      alice1.save!
      alice2.should be_valid
    end
  end
end