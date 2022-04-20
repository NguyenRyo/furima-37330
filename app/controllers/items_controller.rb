class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :item_find, only:[:show, :edit, :update]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      item = Item.find(params[:id])
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,:description, :image, :category_id, :condition_id, :deliver_fee_cover_id, :prefecture_id, :deliver_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find params[:id]
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_find
    @item = Item.find(params[:id])
 
  end

end
