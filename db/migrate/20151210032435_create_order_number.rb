class CreateOrderNumber < ActiveRecord::Migration
  def change
    create_table :order_numbers do |t|

    end
  end

  def change
  	add_column :orders, :order_number, :integer
  end

end
