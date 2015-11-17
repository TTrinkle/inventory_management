class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.float :mom_pay, default: 0.0
    	t.float :etsy_bill, default: 0.0
    	t.float :tanya_pay, default: 0.0
    	t.float :shop_money, default: 0.0
    	t.float :inventory_money, default: 0.0
    	t.integer :user_id
    	
      t.timestamps null: false
    end
  end
end
