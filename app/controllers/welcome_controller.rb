class WelcomeController < ApplicationController
  def index
    @transactions = Transaction.where("")
  end
end