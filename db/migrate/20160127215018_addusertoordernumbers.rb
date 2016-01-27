class Addusertoordernumbers < ActiveRecord::Migration
  def change
  	add_column :order_numbers, :user_id, :integer
  end
end
