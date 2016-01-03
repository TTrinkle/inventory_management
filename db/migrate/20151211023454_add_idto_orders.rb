class AddIdtoOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :order_number_id, :integer
  end
end
