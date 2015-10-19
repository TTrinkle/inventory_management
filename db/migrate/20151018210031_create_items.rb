class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :item_type
    	t.string :color
    	t.string :size
    	t.integer :number, default: 0
    	
      t.timestamps null: false
    end
  end
end