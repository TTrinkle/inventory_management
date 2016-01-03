class AddOrderNumbers < ActiveRecord::Migration
  def change
    create_table :order_numbers do |t|
    	t.integer :number
  	end
  end
end
