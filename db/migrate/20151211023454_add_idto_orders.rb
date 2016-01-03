class AddIdtoOrders < ActiveRecord::Migration
  def change
  	remove_column :orders, :order_number
  	add_column :orders, :order_number_id, :integer
  end
end
