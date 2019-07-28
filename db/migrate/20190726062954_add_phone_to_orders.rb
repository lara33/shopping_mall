class AddPhoneToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :recipient, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
    add_column :orders, :note, :text
  end
end
