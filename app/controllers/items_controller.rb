class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit]
  before_action :set_item, only: [:destroy, :edit, :show, :update]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end
  
  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def edit
    @grandchild = Category.find(@item.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def update
    if @item.update!(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render "edit"
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
    else
      render "show", alert: "削除に失敗しました"
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :remarks, :shop, :deadline, :quantity, :category_id, images_attributes: [:image, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end