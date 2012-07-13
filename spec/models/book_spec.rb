require 'spec_helper'

describe Book do
  describe "'s validation" do
    it "should create a new instance" do
      book = build(:book)
      book.should be_valid
    end

    it "shouldn't create a new instance if title is blank" do
      book = build(:book, title: "")
      book.should be_invalid
    end

    it "shouldn't create a new instance if no user" do
      book = build(:book, author: nil)
      book.should be_invalid
    end

    it "shouldn't create a new instance if title isn't unique" do
      author = create(:author)
      alice1 = build(:book, author: author)
      alice2 = build(:book, author: author)

      alice1.save!
      alice2.should be_invalid
    end

    it "should create a new instance if title is unique per user" do
      john = create(:author, :john)
      park = create(:author, :park)

      alice1 = build(:book, author: john)
      alice2 = build(:book, author: park)

      alice1.save!
      alice2.should be_valid
    end
  end
end