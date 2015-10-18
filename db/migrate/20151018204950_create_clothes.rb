class CreateClothes < ActiveRecord::Migration
  def change
    create_table :clothes do |t|

      t.timestamps null: false
    end
  end
end
