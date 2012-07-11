class Book < ActiveRecord::Base
  attr_accessible :title

  belongs_to :user
  has_many :transactions, :dependent => :destroy

  validates_presence_of :title, :user_id
  validates_uniqueness_of :title, :scope => :user_id
end