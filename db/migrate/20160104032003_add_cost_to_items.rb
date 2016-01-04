class AddCostToItems < ActiveRecord::Migration
  def change
  	add_column :items, :cost, :float, default: 0.0
  end
end
