class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @sell_item = BuyDelivery.new
    redirect_to root_path if current_user.id == @item.user_id || @item.buy.presence
  end

  def create
    @item = Item.find(params[:item_id])
    @sell_item = BuyDelivery.new(sell_item_params)
    if @sell_item.valid?
      pay_item
      @sell_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sell_item_params
    params.require(:buy_delivery).permit(:postal_code, :consignor_id, :city, :address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
