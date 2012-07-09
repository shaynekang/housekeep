class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :avatar

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

      info = auth['info']

      user.name = info['nickname'] unless info['nickname'].blank?
      user.name = info['name'] unless info['name'].blank?
      user.email = info['email'] unless info['email'].blank?
      user.avatar = info['image'] unless info['image'].blank?

      user.save!
      user
    end
  end
end