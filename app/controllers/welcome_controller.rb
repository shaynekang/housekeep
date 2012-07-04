class WelcomeController < ApplicationController
  def index
    @pages = Page.where("")
  end
end