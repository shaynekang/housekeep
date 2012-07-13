# encoding: UTF-8

class PagesController < ApplicationController
  before_filter :find_pages

  def new
    @page = @pages.build
  end

  def edit
    @page = @pages.find(params[:id])
  end

  def create
    @page = @pages.build(params[:page])
    if @page.save
      redirect_to :pages, notice: "새로운 내역을 만들었습니다."
    else
      render 'new'
    end
  end

  def update
    @page = @pages.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to :pages, notice: "내역을 수정했습니다."
    else
      render 'new'
    end
  end

  def destroy
    @page = @pages.find(params[:id])
    @page.destroy
    redirect_to :pages, notice: "성공적으로 내역을 제거하였습니다."
  end

  private
  def find_pages
    @pages = current_user.books.default.pages
  end
end