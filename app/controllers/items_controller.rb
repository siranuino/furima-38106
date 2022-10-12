class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :defrayment_id, :area_id, :deliverytime_id, :price, :genre_id, :item_status_id, :charge_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end