class Order < ApplicationRecord
  has_many :order_items
  default_scope { order(id: :desc) }
  include AASM

  aasm column: :state do
    state :pending, initial: true
    #初始狀態
    state :paid, :shipping, :delivered, :returned, :refunded
    #已付款 / 出貨中 / 已到貨 / 已退貨 / 已退款

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :delivering do
      transitions from: :shipping, to: :delivered
    end

    event :return do
      transitions from: [:delivered, :shipping], to: :returned
    end

    event :refund do
      transitions from: [:paid, :returned], to: :refunded
    end
  end
end
