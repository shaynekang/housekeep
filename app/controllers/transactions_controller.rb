# encoding: UTF-8

class TransactionsController < ApplicationController
  before_filter :find_transactions

  def new
    @transaction = @transactions.build
  end

  def edit
    @transaction = @transactions.find(params[:id])
  end

  def create
    @transaction = @transactions.build(params[:transaction])
    if @transaction.save
      redirect_to :transactions, notice: "새로운 내역을 만들었습니다."
    else
      render 'new'
    end
  end

  def update
    @transaction = @transactions.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to :transactions, notice: "내역을 수정했습니다."
    else
      render 'new'
    end
  end

  def destroy
    @transaction = @transactions.find(params[:id])
    @transaction.destroy
    redirect_to :root, notice: "성공적으로 내역을 제거하였습니다."
  end

  private
  def find_transactions
    @transactions = current_user.default_book.transactions
  end
end