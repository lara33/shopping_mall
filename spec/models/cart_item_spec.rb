require "rails_helper"

RSpec.describe CartItem, type: :model do
  it "每個 Cart Item 都可以計算金額" do
    p1 = Product.create(title: "guns gore", price: 1100)      
    p2 = Product.create(title: "steep", price: 1200)   

    cart = Cart.new
    3.times { cart.add_item(p1.id) }  
    4.times { cart.add_item(p2.id) }  
    5.times { cart.add_item(p1.id) }  

    expect(cart.items.first.price).to be 8800   
    expect(cart.items.second.price).to be 4800  
  end
end
