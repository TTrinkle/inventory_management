class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :name, null: :false
      t.integer :number, default: 0
      t.string :color, null: :false
      t.string :position

      t.timestamps null: false
    end
  end
end
