class Page < ActiveRecord::Base
  attr_accessible :amount, :note

  validates :amount, presence: true, numericality: true
  validates :note, presence: true

  validate :amount_cannot_be_zero
  def amount_cannot_be_zero
    errors.add(:amount, "amount can't be zero") if amount == 0
  end

  class << self
    def incomes
      where('amount > ?', 0)
    end

    def expenses
      where('amount < ?', 0)
    end
  end

  def income?
    amount > 0
  end

  def expense?
    amount < 0
  end
end