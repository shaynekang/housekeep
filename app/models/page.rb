class Page < ActiveRecord::Base
  default_scope order('transacted_at DESC')

  attr_accessible :amount, :note, :transacted_at

  belongs_to :book

  validates :book_id, presence: true
  validates :amount, presence: true, numericality: true
  validates :note, presence: true

  validate :amount_should_not_be_zero

  module ClassMethods
    def total
      sum(&:amount)
    end

    def group_by_date
      grouped = scoped.group_by {|page| page.transacted_date}
      grouped.each{|date, pages| pages.extend(ClassMethods)}
      grouped
    end
  end
  extend ClassMethods

  def income?
    amount > 0
  end

  def expense?
    amount < 0
  end

  def transacted_date
    transacted_at.strftime("%Y-%m-%d")
  end

  private
  def amount_should_not_be_zero
    errors.add(:amount, "amount can't be zero") if amount == 0
  end
end