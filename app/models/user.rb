class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :avatar

  validates_presence_of :provider, :uid, :name, :email
  validates_uniqueness_of :uid, :scope => :provider
end