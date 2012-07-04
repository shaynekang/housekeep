class Page < ActiveRecord::Base
  attr_accessible :amount, :note

  validates :amount, presence: true, numericality: true
  validates :note, presence: true

  validate :amount_should_not_be_zero

  scope :incomes,  where('amount > ?', 0)
  scope :expenses, where('amount < ?', 0)

  class << self
    def total
      sum(:amount)
    end
  end

  def income?
    amount > 0
  end

  def expense?
    amount < 0
  end

  private
  def amount_should_not_be_zero
    errors.add(:amount, "amount can't be zero") if amount == 0
  end
end