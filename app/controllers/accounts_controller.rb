class ItemsController < ApplicationController

  def index
    @account = current_user.accounts
  end

  def show
  end

  def new
  end

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
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  

    # Never trust parameters from the scary internet, only allow the white list through.
end
