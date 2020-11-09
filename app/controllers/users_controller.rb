class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.all
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      @item = Item.all
    else
      redirect_to root_path
    end
  end
end