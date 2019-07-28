module Payable
  extend ActiveSupport::Concern

  
  def gateway
    @gateway ||= Braintree::Gateway.new( # ||= 如果找不到的話就做一個新的 Gateway
      environment: ENV["paypal_environment"].to_sym,
      merchant_id: ENV["paypal_merchant_id"],
      public_key: ENV["paypal_public_key"],
      private_key: ENV["paypal_private_key"],
      )
    end
    # def gateway
    #   @gateway ||= Braintree::Gateway.new(
    #     environment: :sandbox,
    #     merchant_id: :'hbqcp4r4cv9bwnz9',
    #     public_key: :'shqhznyxy6b3mws4',
    #     private_key: :'fc704ecddc7f3c78bcba0bf720529701',
    #   )
    # end
    
  included do
  end

  class_methods do
  end
  
end
