class WelcomeController < ApplicationController
  skip_before_filter :login_required
  before_filter :display_login_page

  def index
    @pages = current_user.books.default.pages
  end

  private
  def display_login_page
    render 'login', layout: 'login' unless current_user
  end
end