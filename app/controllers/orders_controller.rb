class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

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
    @order = Order.new(order_params)
    # letter_1 = Letter.where(position: 'top', name: order_params[:letter_1], color: order_params[:top_color]).first.remove_one
    # letter_2 = Letter.where(position: 'top', name: order_params[:letter_2], color: order_params[:top_color]).first.remove_one
    # letter_3 = Letter.where(position: 'top', name: order_params[:letter_3], color: order_params[:top_color]).first.remove_one
    # letter_4 = Letter.where(position: 'bottom', name: order_params[:letter_1], color: order_params[:bottom_color]).first.remove_one
    # letter_5 = Letter.where(position: 'bottom', name: order_params[:letter_2], color: order_params[:bottom_color]).first.remove_one
    # letter_6 = Letter.where(position: 'bottom', name: order_params[:letter_3], color: order_params[:bottom_color]).first.remove_one

    # if Item.where(item_type: :shirt_type, color: :shirt_color, size: :size)
    #   item = Item.where(item_type: order_params[:shirt_type], color: order_params[:shirt_color], size: order_params[:shirt_size]).first
    #   item.number -= 1
    #   item.save
    # else
    #   new_item = Item.create(item_type: order_params[:shirt_type], color: order_params[:shirt_color], size: order_params[:shirt_size], user_id: current_user.id)
    #   new_item.number = -1
    #   new_item.save
    # end
    shirt_type = order_codes[params[:order_code]][:type]
    letter = order_codes[params[:order_code]][:letter]
    count = order_codes[params[:order_code]][:count]
    current_user.order_breakdown(shirt_type, 25.00, letter, count)
    
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
      params.require(:order).permit(:letter_1, :letter_2, :letter_3, :top_color, :bottom_color, :shirt_size, :shirt_type, :shirt_color, :order_code)
    end
end
