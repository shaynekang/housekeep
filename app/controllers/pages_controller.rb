# encoding: UTF-8

class PagesController < ApplicationController
  def new
    @pages = Page.where("")
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to :root, notice: "새로운 내역을 만들었습니다."
    else
      @pages = Page.where("")
      render 'new'
    end
  end
end