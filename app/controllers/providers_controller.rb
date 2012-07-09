class ProvidersController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @user = User.find_or_create_with_omniauth!(auth)
    session[:user_id] = @user.id
    redirect_to :root, notice: "Successfully Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: "Successfully Signed out!"
  end
end