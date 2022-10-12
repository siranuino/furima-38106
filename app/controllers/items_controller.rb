class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :defrayment_id, :area_id, :deliverytime_id, :price).merge(user_id: current_user.id)
  end
end
