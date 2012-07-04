# encoding: UTF-8

class TransactionsController < ApplicationController
  before_filter :find_transactions

  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      redirect_to :root, notice: "새로운 내역을 만들었습니다."
    else
      render 'new'
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update_attributes(params[:transaction])
      redirect_to :root, notice: "내역을 수정했습니다."
    else
      render 'new'
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to :root, notice: "성공적으로 내역을 제거하였습니다."
  end

  private
  def find_transactions
    @transactions = Transaction.where("")
  end
end