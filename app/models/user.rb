class User < ActiveRecord::Base
  has_one :account
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :etsy_bill, :mom_pay, :tanya_pay, :shop_money, :inventory_money

  def initialize
  	@mom_pay = 0.0
  	@etsy_bill = 0.0
  	@tanya_pay = 0.0
  	@shop_money = 0.0
  	@inventory_money = 0.0
  end

  def shipping paid_shipping, shipping_spent
  	@etsy_bill += shipping_spent
  	@shop_money += paid_shipping - shipping_spent
  end

  def order_breakdown shirt_type, letter_type, order_total, letter_count
    order_total = order_total.to_f
  	case shirt_type
	  	when 'tshirt'
	  		clothing_cost = 3
	  		mom_cost = 8
	  	when 'vneck'
	  		clothing_cost = 4
	  		mom_cost = 8
	  	when 'blanket'
	  		clothing_cost = 10
	  		mom_cost = 8
	  	when 'sweatshirt', 'sweatpants'
	  		clothing_cost = 10
	  		mom_cost = 10
	  	else
	  		clothing_cost = 6
	  		mom_cost = 8
  	end
  	etsy_fee = 0.20 + (order_total * 0.035)
  	order_total -= mom_cost
  	@mom_pay += mom_cost
  	order_total -= etsy_fee
  	@etsy_bill += etsy_fee
  	if letter_type == 'glitter'
  		order_total -= 1.20
  		if letter_count < 3
  			@inventory_money += 0.80
  			@shop_money += 0.40
  		else
  			@inventory_money += 1.20
  		end
  	else
      order_total -= 0.90
      if letter_count < 3
        @inventory_money += 0.60
        @shop_money += 0.40
      else
        @inventory_money += 0.90
      end
    end
    order_total -= clothing_cost
    @inventory_money += clothing_cost
    order_total -= 5.00
    @tanya_pay += 5.00
    @shop_money += order_total
    order_total = 0
  end
end


