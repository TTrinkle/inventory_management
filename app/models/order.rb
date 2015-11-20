class Order < ActiveRecord::Base

	def letter_count
	end

	def paid_shipping
	end

	def shipping_spent
	end

	def order_code
	end

	def order_total
	end

	def paid_shipping
	end

	def quantity
	end

	def shipping_spent
	end


	def order_breakdown shirt_type, letter_type, order_total, letter_count, quantity
	  quantity = quantity.to_f   #3
	  order_total = order_total.to_f #25
	  inventory_money = 0  
	  tanya_pay = 0
	  shop_money = 0
	  etsy_bill = 0
		case shirt_type
	  	when 'tshirt'
	  		clothing_cost = 3  #3
	  		mom_cost = 8        #8
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
		etsy_fee = 0.20 + (order_total * quantity * 0.035) 
		order_total -= (mom_cost * quantity)
		order_total -= etsy_fee
		etsy_bill += etsy_fee
		if letter_type == 'glitter'
			order_total -= (1.20 * quantity)
			if letter_count < 3
				inventory_money += (0.80 * quantity)
				shop_money += (0.40 * quantity)
			else
				inventory_money += (1.20 * quantity)
			end
		else
	    order_total -= 0.90
	    if letter_count < 3
	      inventory_money += 0.60
	      shop_money += 0.40
	    else
	      inventory_money += 0.90
	    end
	  end
	  order_total -= (clothing_cost * quantity)
	  inventory_money += (clothing_cost * quantity)
	  order_total -= 5.00 * quantity
	  tanya_pay += 5.00 * quantity
	  shop_money += order_total
	  costs = {mom_pay: mom_cost * quantity, 
	          tanya_pay: tanya_pay, 
	          inventory_money: inventory_money,
	          shop_money: shop_money,
	          etsy_bill: etsy_bill }
	end
end
