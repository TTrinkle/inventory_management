class AccountsController < ApplicationController

  def index
    @account = current_user.account
  end

  def show
    p 'HEYYYYYYY'
  end

  def new
  end

  # def pay_mom
  #   @account = current_user.account.update(mom_pay: 0)
  #   @account.save
  # end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    p "THIS IS AN UPDATEEEE"
    @account = current_user.account
    @account.pay_mom
    p @account
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
   
  end

  def pay_mom
    acc = Account.find(params[:id])
    p acc
    acc.update(mom_pay: 0)
    acc.save
    acc
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  

    # Never trust parameters from the scary internet, only allow the white list through.
end
