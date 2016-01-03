class AddNumbertoOrderNumbers < ActiveRecord::Migration
  def change
  	add_column :order_numbers, :number, :integer
  end
end
