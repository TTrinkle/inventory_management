class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /letters
  # GET /letters.json
  def index
    top_letters = Letter.where(position: 'top', user_id: current_user.id).order(:name, :number)
    bottom_letters = Letter.where(position: 'bottom', user_id: current_user.id).order(:name, :number)
    @letters = {top_letters: top_letters, bottom_letters: bottom_letters}
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
  end

  # GET /letters/new
  def new
    @letter = Letter.new
  end

  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create
    p letter_params
    if Letter.where(color: letter_params[:color], position: letter_params[:position], name: letter_params[:name]).length > 0 
      respond_to do |format|
        format.html { redirect_to letters_url, alert: 'Letter already exists.' }
        format.json { head :no_content }
      end
    else
      @letter = Letter.new(letter_params)
      @letter.user_id = current_user.id
      respond_to do |format|
        if @letter.save
          format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
          format.json { render :show, status: :created, location: @letter }
        else
          format.html { render :new }
          format.json { render json: @letter.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter }
      else
        format.html { render :edit }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_set
    p params
    letter = Letter.find(params[:id])
    letter.add_set
    letter.save
    respond_to do |format|
      format.html { redirect_to letters_url, notice: 'Letter was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def welcome
    render template: "layouts/home"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:name, :number, :color, :position)
    end
end
