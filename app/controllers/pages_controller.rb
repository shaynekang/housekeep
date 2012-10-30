# encoding: UTF-8

class PagesController < ApplicationController
  before_filter :find_pages
  respond_to :html, :js

  def new
    @page = @pages.build
  end

  def edit
    @page = @pages.find(params[:id])
  end

  def create
    @page = @pages.build(params[:page])
    if @page.save
      redirect_to :root, notice: "Successfully create a new page."
    else
      render 'new'
    end
  end

  def update
    @page = @pages.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to :root, notice: "Successfully edit a page."
    else
      render 'new'
    end
  end

  def destroy
    @page = @pages.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully remove the page."
    respond_with @page, location: :root
  end

  private
  def find_pages
    @pages = current_user.books.default.pages
  end
end