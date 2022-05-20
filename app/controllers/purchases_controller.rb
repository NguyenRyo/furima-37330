class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: :index
  before_action :find_item_by_item_id, only:[:index, :create]

  def index
    @purchase_buyer = PurchaseBuyer.new
  end 
  
  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      find_item_by_item_id
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:postalcode, :prefecture_id, :city, :address, :building, :tel).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
  end

  def move_to_index
    find_item_by_item_id
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def find_item_by_item_id
    @item = Item.find(params[:item_id])
  end

end
