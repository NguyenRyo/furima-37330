class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @purchase_buyer = PurchaseBuyer.new
    @item = Item.find(params[:item_id])
  end 
  
  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_buyer.valid?
      pay_item
      Payjp.api_key = "sk_test_03ba0f8bdf953688f84be0c6"
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @purchase_buyer.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:postalcode, :prefecture_id, :city, :address, :building, :tel).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def pay_item
    Payjp.api_key = "sk_test_03ba0f8bdf953688f84be0c6"
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
end
