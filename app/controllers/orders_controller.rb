class OrdersController < ApplicationController
  include CartsHelper
  include Payable
  def create
    #建立訂單
    @order = Order.new(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(product: item.product,
                               quantity: item.quantity,
                               strike_price: item.product.price)
    
    end
    if @order.save
      # 刷卡
      nonce = params[:payment_method_nonce]

      result = gateway.transaction.sale(
          amount: current_cart.total_price,
          payment_method_nonce: nonce,
          order_id: @order.id,
          options: {
            submit_for_settlement: true
          }
      )

      if result.success?
          # 清空購物車
      session[:cart9999] = nil  
      redirect_to products_path, notice: '感謝大爺！'
      else
      render 'carts/checkout'
      end
    end
  
   
  end
  
  
  private

  def order_params
    params.require(:order).permit(:recipient, :phone, :address, :note)
  end
  # def gateway
  #   Braintree: :Gateway.new(
  #   environment: :sandbox,
  #   merchant_id: :'hbqcp4r4cv9bwnz9',
  #   public_key: :'shqhznyxy6b3mws4',
  #   private_key: :'fc704ecddc7f3c78bcba0bf720529701'
  #   )
  # end
end
