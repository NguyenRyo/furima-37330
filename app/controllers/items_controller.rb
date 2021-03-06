class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :destroy]
    before_action :item_find, only:[:show, :edit, :update, :destroy]
    before_action :move_to_index, only: [:edit, :destroy]
    before_action :move_to_index_soldout, only: [:edit]

  def index
    @items = Item.all
    @items = Item.all.order(created_at: :desc)
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
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:title,:description, :image, :category_id, :condition_id, :deliver_fee_cover_id, :prefecture_id, :deliver_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def move_to_index_soldout
    if @item.purchase.present?
      redirect_to action: :index
    end
  end

end
