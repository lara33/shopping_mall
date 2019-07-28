class CartsController < ApplicationController
  include CartsHelper
  include Payable
  def add
    current_cart.add_item(params[:id])
    session[Cart::SessionKey] = current_cart.serialize

    redirect_to products_path, notice: "已加入購物車"
  end

  def destroy
    session[Cart::SessionKey] = nil
    redirect_to products_path, notice: "購物車已清空"
  end

  def show
  end
  def checkout
    @order = Order.new
    @token = gateway.client_token.generate
  end
end
