class BuysController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    
  end

  private
  def sell_item_params
    params.require(:form).permit(:user_id, :item_id, :postal_code, :consignor_id, :city, :address, :building, :tel, :buy_id).merge(user_id: current_user.id)
  end

end
