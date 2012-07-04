class Page < ActiveRecord::Base
  attr_accessible :amount, :note

  validates :amount, presence: true, numericality: true
  validates :note, presence: true

  class << self
    def incomes
      where('amount > ?', 0)
    end

    def expenses
      where('amount < ?', 0)
    end
  end
end