require 'spec_helper'

describe Book do
  BOOK_VALID_ATTRIBUTES = {title: "Alice in the Wonderland"}
  def book_attributes(options={})
    BOOK_VALID_ATTRIBUTES.merge(options)
  end

  USER_VALID_ATTRIBUTES = {provider: "twitter", uid: "37", name: "John Doe"}
  def user_attributes(options={})
    USER_VALID_ATTRIBUTES.merge(options)
  end

  def user
    @user ||= User.create!(user_attributes)
  end


	describe "'s validation" do
    it "should create a new instance" do
      book = user.books.build(book_attributes)
      book.should be_valid
    end

    it "shouldn't create a new instance if title is blank" do
      book = user.books.build(book_attributes(title: ""))
      book.should be_invalid
    end

    it "shouldn't create a new instance if no user" do
      book = Book.new(book_attributes)
      book.should be_invalid
    end

    it "shouldn't create a new instance if title isn't unique" do
      alice1 = user.books.build(book_attributes)
      alice2 = user.books.build(book_attributes)

      alice1.save!
      alice2.should be_invalid
    end

    it "should create a new instance if title is unique per user" do
      john = User.create!(user_attributes(uid: "38", name: "John Doe"))
      park = User.create!(user_attributes(uid: "24", name: "Park Park"))

      alice1 = john.books.build(book_attributes)
      alice2 = park.books.build(book_attributes)

      alice1.save!
      alice2.should be_valid
    end
  end
end