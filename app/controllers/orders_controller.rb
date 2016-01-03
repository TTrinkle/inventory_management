
class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  attr_reader :order_codes

  def initialize
    @order_codes = {
      16 => {type: 'tshirt', count: 2, letter: 'glitter', item_cost: 3},
      17 => {type: 'tshirt', count: 3, letter: 'glitter', item_cost: 3},
      18 => {type: 'tshirt',count: 2, letter: 'none', item_cost: 3},
      19 => {type: 'tshirt',count: 3, letter: 'none', item_cost: 3},
      26 => {type: 'vneck' ,count: 2, letter: 'glitter', item_cost: 3},
      27 => {type: 'vneck', count: 3, letter: 'glitter', item_cost: 4},
      28 => {type: 'vneck', count: 2, letter: 'none', item_cost: 4},
      29 => {type: 'vneck', count: 3, letter: 'none', item_cost: 4},
      36 => {type: 'blanket',count: 2, letter: 'glitter', item_cost: 4},
      37 => {type: 'blanket',count: 3, letter: 'glitter', item_cost: 11},
      38 => {type: 'blanket',count: 2, letter: 'none', item_cost: 11},
      39 => {type: 'blanket',count: 3, letter: 'none', item_cost: 11},
      46 => {type: 'sweatshirt' ,count: 2, letter: 'glitter', item_cost: 11},
      47 => {type: 'sweatshirt',count: 3, letter: 'glitter', item_cost: 10},
      48 => {type: 'sweatshirt',count: 2, letter: 'none', item_cost: 10},
      49 => {type: 'sweatshirt',count: 3, letter: 'none', item_cost: 10},
      56 => {type: 'sweatpants',count: 2, letter: 'glitter', item_cost: 10},
      57 => {type: 'sweatpants',count: 3, letter: 'glitter', item_cost: 10},
      58 => {type: 'sweatpants',count: 2, letter: 'none', item_cost: 10},
      59 => {type: 'sweatpants',count: 3, letter: 'none', item_cost: 10},
      66 => {type: 'long_sleeve',count: 2, letter: 'glitter', item_cost: 6},
      67 => {type: 'long_sleeve',count: 3, letter: 'glitter', item_cost: 6},
      68 => {type: 'long_sleeve',count: 2, letter: 'none', item_cost: 6},
      69 => {type: 'long_sleeve',count: 3, letter: 'none', item_cost: 6}
    }
  end
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    code = order_params[:order_code].to_i
    shirt_type = @order_codes[code][:type]
    letter = @order_codes[code][:letter]
    count = @order_codes[code][:count]
    size = order_params[:shirt_size]
    if order_params[:letter_3] != 'none'
      letter_3 = order_params[:letter_3]
    else
      letter_3 = nil
    end
    number = OrderNumber.create!(number: order_params[:order_number])
    @order = Order.new(letter_1: order_params[:letter_1], 
                    letter_2: order_params[:letter_2], 
                    letter_3: letter_3, 
                    shirt_type: shirt_type, 
                    shirt_size: order_params[:shirt_size], 
                    shirt_color: order_params[:shirt_color], 
                    top_color: order_params[:top_color], 
                    bottom_color: order_params[:bottom_color], 
                    user_id: current_user.id,
                    order_number: number)

    # order_params[:quantity].to_i.times do |order|  
    #   letter_1 = Letter.where(position: 'top', name: order_params[:letter_1], color: order_params[:top_color]).first.remove_one
    #   letter_2 = Letter.where(position: 'top', name: order_params[:letter_2], color: order_params[:top_color]).first.remove_one
    #   letter_3 = Letter.where(position: 'top', name: order_params[:letter_3], color: order_params[:top_color]).first.remove_one
    #   letter_4 = Letter.where(position: 'bottom', name: order_params[:letter_1], color: order_params[:bottom_color]).first.remove_one
    #   letter_5 = Letter.where(position: 'bottom', name: order_params[:letter_2], color: order_params[:bottom_color]).first.remove_one
    #   letter_6 = Letter.where(position: 'bottom', name: order_params[:letter_3], color: order_params[:bottom_color]).first.remove_one
    # end

    if Item.where(item_type: shirt_type, color: order_params[:shirt_color], size: size).count > 0
      item = Item.where(item_type: shirt_type, color: order_params[:shirt_color], size: size).first
      item.number -= order_params[:quantity].to_i
      item.save
    else
      new_item = Item.create(item_type: shirt_type, color: order_params[:shirt_color], size: size, user_id: current_user.id)
      new_item.number = (0 - order_params[:quantity].to_i)
      new_item.save
    end

    p order_params
    cost_breakdown = @order.order_breakdown(shirt_type, letter, order_params[:order_total], count, order_params[:quantity])
    p cost_breakdown
    current_user.account.update(
      mom_pay: current_user.account.mom_pay += cost_breakdown[:mom_pay],
      tanya_pay: current_user.account.tanya_pay += cost_breakdown[:tanya_pay],
      shop_money: current_user.account.shop_money += (cost_breakdown[:shop_money] + (order_params[:paid_shipping].to_f - order_params[:shipping_spent].to_f)),
      inventory_money: current_user.account.inventory_money += cost_breakdown[:inventory_money],
      etsy_bill: current_user.account.etsy_bill += (cost_breakdown[:etsy_bill] + order_params[:shipping_spent].to_f)
      )
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_mom_pay
  end

  def update_tanya_pay
  end

  def update_shop_money
  end

  def update_inventory_money
  end

  def update_etsy_bill 
  end
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:letter_1, :letter_2, :letter_3, :top_color, :bottom_color, :shirt_size, :shirt_type, :shirt_color, :order_code, :order_total, :order_number, :paid_shipping, :shipping_spent, :quantity)
    end
end
