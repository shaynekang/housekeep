class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :avatar

  has_many :books, foreign_key: :author_id, :dependent => :destroy

  validates_presence_of :provider, :uid, :name
  validates_uniqueness_of :uid, :scope => :provider

  class << self
    def find_or_create_with_omniauth!(auth)
      users = where(provider: auth['provider'], uid: auth['uid'])
      user = unless users.empty?
               users.first
             else
               new(provider: auth['provider'], uid: auth['uid'])
             end

      user.insert_omniauth_info(auth['info'])
      user.save!
      user
    end
  end

  def insert_omniauth_info(info)
    self.name = info['nickname'] unless info['nickname'].blank?
    self.name = info['name'] unless info['name'].blank?
    self.email = info['email'] unless info['email'].blank?
    self.avatar = info['image'] unless info['image'].blank?
  end

  def default_book
    unless books.empty?
      books.first
    else
      books.create!(title: "default")
    end
  end
end