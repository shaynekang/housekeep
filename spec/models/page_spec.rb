require 'spec_helper'

describe Page do
  DEFAULT_PARAMETERS = {amount: 0, note: "salary"}
  def make_page(params={})
    Page.new(DEFAULT_PARAMETERS.merge(params))
  end
  def create_page(params={})
    Page.create!(DEFAULT_PARAMETERS.merge(params))
  end

  describe "'s validation" do
    it "should create a new instnce" do
      page = make_page
      page.should be_valid
    end

    it "shouldn't create a new instnce if amount is blank" do
      page = make_page(amount: nil)
      page.should be_invalid
    end

    it "shouldn't create a new instnce if note is blank" do
      page = make_page(note: nil)
      page.should be_invalid
    end

    it "shouldn't create a new instnce if amount isn't numeric" do
      page = make_page(amount: "abc")
      page.should be_invalid
    end
  end

  describe "#incomes" do
    it "should return income pages" do
      expense = create_page(amount: -10)
      income1 = create_page(amount: +10)
      income2 = create_page(amount: +20)
      income3 = create_page(amount: +50)

      Page.incomes.should == [income1, income2, income3]
    end
  end

  describe "#expenses" do
    it "should return expense pages" do
      expense1 = create_page(amount: -50)
      expense2 = create_page(amount: -20)
      expense3 = create_page(amount: -10)
      income   = create_page(amount: +10)

      Page.expenses.should == [expense1, expense2, expense3]
    end
  end
end