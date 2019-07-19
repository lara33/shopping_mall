require "rails_helper"

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
    it "可將商品放置購物車內" do
      cart = Cart.new
      cart.add_item 1
      expect(cart.empty?).to be false
    end
  end

  it "如果加了相同種類的商品到購物車裡，購買項目(CartItem)並不會增加，但商品的數量會改變" do
    cart = Cart.new                             
    3.times { cart.add_item(1) }                
    5.times { cart.add_item(2) }                
    4.times { cart.add_item(3) }                

    expect(cart.items.length).to be 3           # 總共應該會有 3 個 item
    expect(cart.items.first.quantity).to be 3   # 第 1 個 item 的數量會是 3
    expect(cart.items.second.quantity).to be 5  # 第 2 個 item 的數量會是 5
  end
end
