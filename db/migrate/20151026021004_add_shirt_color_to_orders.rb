class AddShirtColorToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :shirt_color, :string
  end
end
