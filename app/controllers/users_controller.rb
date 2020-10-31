class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all
  end

  def show
    @user = User.find(params[:id])
    @item = Item.all
  end  
end