class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :login_required
  helper_method :current_user

  private
  def login_required
    redirect_to :root unless current_user
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
