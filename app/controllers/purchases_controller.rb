class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @purchase_buyer = PurchaseBuyer.new
    @item = Item.find(params[:item_id])
  end 

  def new
  end
  
  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:postalcode, :prefecture_id, :city, :address, :building, :tel).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
