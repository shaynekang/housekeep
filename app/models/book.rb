class Book < ActiveRecord::Base
  attr_accessible :title

  belongs_to :author, class_name: 'User'
  has_many :transactions, :dependent => :destroy

  validates_presence_of :title, :author_id
  validates_uniqueness_of :title, :scope => :author_id

  class << self
    def default
      first_or_create!(title: "default")
    end
  end
end