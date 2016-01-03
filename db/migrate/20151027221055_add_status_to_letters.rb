class AddStatusToLetters < ActiveRecord::Migration
  def change
  	add_column :letters, :status, :string
  end
end
