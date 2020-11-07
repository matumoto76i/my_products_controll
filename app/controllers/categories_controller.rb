class CategoriesController < ApplicationController
  before_action :set_category, only: :show
  before_action :authenticate_user!

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @items = @category.set_items
    @items = @items.order("created_at DESC").page(params[:page]).per(9)
  end

  private
  
  def set_category
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    else
      @category_links = @category.siblings
    end
  end
end