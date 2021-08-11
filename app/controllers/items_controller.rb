class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :postage_id, :consignor_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
