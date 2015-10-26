class AddUserToLetter < ActiveRecord::Migration
  def change
  	add_column :letters, :user_id, :integer
  	add_column :orders, :user_id, :integer
  	add_column :items, :user_id, :integer
  end
end
