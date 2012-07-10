class Transaction < ActiveRecord::Base
  default_scope order('transacted_at DESC')

  attr_accessible :amount, :note, :transacted_at

  validates :amount, presence: true, numericality: true
  validates :note, presence: true

  validate :amount_should_not_be_zero

  scope :incomes,  where('amount > ?', 0)
  scope :expenses, where('amount < ?', 0)

  module ClassMethods
    def total
      sum(&:amount)
    end
  end
  extend ClassMethods

  class << self
    def group_by_date
      grouped = scoped.group_by {|transaction| transaction.transacted_at.strftime("%Y.%m.%d")}
      grouped.each{|date, transactions| transactions.extend(ClassMethods)}
      grouped
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