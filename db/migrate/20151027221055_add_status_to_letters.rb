class AddStatusToLetters < ActiveRecord::Migration
  def change
  	add_column :letters, :status, :string
  	add_column :items, :status, :string
  end
end
