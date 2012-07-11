require 'spec_helper'

describe Transaction do
  describe "'s default scope" do
    it "should order by transacted_at column" do
      now = DateTime.now
      transaction1 = create(:transaction, transacted_at: now - 3.day)
      transaction2 = create(:transaction, transacted_at: now - 1.day)
      transaction3 = create(:transaction, transacted_at: now - 2.day)
      Transaction.all.should == [transaction2, transaction3, transaction1]
    end
  end

  describe "'s validation" do
    it "should create a new instnce" do
      transaction = build(:transaction)
      transaction.should be_valid
    end

    it "shouldn't create a new instnce if amount is blank" do
      transaction = build(:transaction, amount: nil)
      transaction.should be_invalid
    end

    it "shouldn't create a new instnce if note is blank" do
      transaction = build(:transaction, note: nil)
      transaction.should be_invalid
    end

    it "shouldn't create a new instnce if amount isn't numeric" do
      transaction = build(:transaction, amount: "abc")
      transaction.should be_invalid
    end

    it "shouldn't create a new instnce if amount is zero" do
      transaction = build(:transaction, amount: 0)
      transaction.should be_invalid
    end
  end

  describe "'s class methods" do
    describe "##incomes" do
      it "should return income transactions" do
        expense = create(:transaction, amount: -10)
        income1 = create(:transaction, amount: +10)
        income2 = create(:transaction, amount: +20)
        income3 = create(:transaction, amount: +50)

        Transaction.incomes.should == [income1, income2, income3]
      end
    end

    describe "##expenses" do
      it "should return expense transactions" do
        expense1 = create(:transaction, amount: -50)
        expense2 = create(:transaction, amount: -20)
        expense3 = create(:transaction, amount: -10)
        income   = create(:transaction, amount: +10)

        Transaction.expenses.should == [expense1, expense2, expense3]
      end
    end

    describe "##total" do
      it "should return total amount of transaction" do
        create(:transaction, amount: -50)
        create(:transaction, amount: -20)
        create(:transaction, amount: +30)

        Transaction.total.should == -40
      end
    end

    describe "##group_by_date" do
      it "should group transaction by transacted_at" do
        yesterday = DateTime.now - 1.day
        today = DateTime.now
        expected = {
          yesterday.strftime("%Y.%m.%d") => 1,
          today.strftime("%Y.%m.%d") => 2
        }

        create(:transaction, transacted_at: yesterday)
        create(:transaction, transacted_at: today)
        create(:transaction, transacted_at: today)

        result = Transaction.group_by_date
        result = Hash[*result.map{|k, v| [k, v.count]}.sort.flatten]
        result.should == expected
      end
    end
  end

  describe "'s instance methods" do
    describe "#income?" do
      it "should return true if transaction is income" do
        transaction = build(:transaction, amount: 10)
        transaction.should be_income
      end
    end

    describe "#expense?" do
      it "should return true if transaction is expense" do
        transaction = build(:transaction, amount: -10)
        transaction.should be_expense
      end
    end
  end
end









