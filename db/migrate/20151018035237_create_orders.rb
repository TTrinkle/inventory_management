class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :letter_1
    	t.string :letter_2
    	t.string :letter_3
    	t.string :shirt_type
    	t.string :top_color
    	t.string :bottom_color

      t.timestamps null: false
    end
  end
end
