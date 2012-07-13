require 'spec_helper'

describe Page do
  describe "'s default scope" do
    it "should order by transacted_at column" do
      book = create(:book)
      now = DateTime.now

      page1 = create(:page, book: book, transacted_at: now - 3.day)
      page2 = create(:page, book: book, transacted_at: now - 1.day)
      page3 = create(:page, book: book, transacted_at: now - 2.day)
      Page.all.should == [page2, page3, page1]
    end
  end

  describe "'s validation" do
    it "should create a new instnce" do
      page = build(:page)
      page.should be_valid
    end

    it "shouldn't create a new instnce if amount is blank" do
      page = build(:page, amount: nil)
      page.should be_invalid
    end

    it "shouldn't create a new instnce if note is blank" do
      page = build(:page, note: nil)
      page.should be_invalid
    end

    it "shouldn't create a new instnce if amount isn't numeric" do
      page = build(:page, amount: "abc")
      page.should be_invalid
    end

    it "shouldn't create a new instnce if amount is zero" do
      page = build(:page, amount: 0)
      page.should be_invalid
    end

    it "shouldn't create a new instance if no book" do
      page = build(:page, book: nil)
      page.should be_invalid
    end
  end

  describe "'s class methods" do
    describe "##incomes" do
      it "should return income pages" do
        book = create(:book)
        expense = create(:page, book: book, amount: -10)
        income1 = create(:page, book: book, amount: +10)
        income2 = create(:page, book: book, amount: +20)
        income3 = create(:page, book: book, amount: +50)

        Page.incomes.should == [income1, income2, income3]
      end
    end

    describe "##expenses" do
      it "should return expense pages" do
        book = create(:book)
        expense1 = create(:page, book: book, amount: -50)
        expense2 = create(:page, book: book, amount: -20)
        expense3 = create(:page, book: book, amount: -10)
        income   = create(:page, book: book, amount: +10)

        Page.expenses.should == [expense1, expense2, expense3]
      end
    end

    describe "##total" do
      it "should return total amount of page" do
        book = create(:book)
        create(:page, book: book, amount: -50)
        create(:page, book: book, amount: -20)
        create(:page, book: book, amount: +30)

        Page.total.should == -40
      end
    end

    describe "##group_by_date" do
      it "should group page by transacted_at" do
        yesterday = DateTime.now - 1.day
        today = DateTime.now
        expected = {
          yesterday.strftime("%Y.%m.%d") => 1,
          today.strftime("%Y.%m.%d") => 2
        }

        book = create(:book)
        create(:page, book: book, transacted_at: yesterday)
        create(:page, book: book, transacted_at: today)
        create(:page, book: book, transacted_at: today)

        result = Page.group_by_date
        result = Hash[*result.map{|k, v| [k, v.count]}.sort.flatten]
        result.should == expected
      end
    end
  end

  describe "'s instance methods" do
    describe "#income?" do
      it "should return true if page is income" do
        page = build(:page, amount: 10)
        page.should be_income
      end
    end

    describe "#expense?" do
      it "should return true if page is expense" do
        page = build(:page, amount: -10)
        page.should be_expense
      end
    end
  end
end









