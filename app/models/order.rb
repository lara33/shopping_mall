class Order < ApplicationRecord
  include AASM

  aasm do
    state :pending, initial: true 
    #初始狀態
    state :paid, :shipping, :delivered, :returned, :refunded
    #已付款 / 出貨中 / 已到貨 / 已退貨 / 已退款
  end

end
