class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]


  def index
    @order_mailing_address = OrderMailingAddress.new
  end

  def create
    @order_mailing_address = OrderMailingAddress.new(order_params)
    if @order_mailing_address.valid?
      pay_item
      @order_mailing_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private


  def order_params
    params.require(:order_mailing_address).permit(:post_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
