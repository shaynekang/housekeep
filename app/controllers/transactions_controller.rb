# encoding: UTF-8

class TransactionsController < ApplicationController
  def new
    @transactions = Transaction.where("")
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      redirect_to :root, notice: "새로운 내역을 만들었습니다."
    else
      @transactions = Transaction.where("")
      render 'new'
    end
  end
end