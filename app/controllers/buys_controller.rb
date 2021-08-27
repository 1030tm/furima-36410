class BuysController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @sell_item = BuyDelivery.new(sell_item_params)
    if @sell_item.valid?
      @sell_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def sell_item_params
    params.permit(:user_id, :item_id, :postal_code, :consignor_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
