class StripclubsController < ApplicationController
  before_action :set_stripclub, only: [:show, :edit, :update, :destroy]

  # GET /stripclubs
  # GET /stripclubs.json
  def index
    @stripclubs = Stripclub.all

    if !params[:search].nil? && !params[:search].empty?
      @stripclubs = @stripclubs.where(name: params[:search])
    end
  end

  # GET /stripclubs/1
  # GET /stripclubs/1.json
  def show
    @review = Review.new
  end

  # GET /stripclubs/new
  def new
    @stripclub = Stripclub.new
  end

  # GET /stripclubs/1/edit
  def edit
  end

  # POST /stripclubs
  # POST /stripclubs.json
  def create
    @stripclub = Stripclub.new(stripclub_params)

    respond_to do |format|
      if @stripclub.save
        format.html { redirect_to @stripclub, notice: 'Stripclub was successfully created.' }
        format.json { render :show, status: :created, location: @stripclub }
      else
        format.html { render :new }
        format.json { render json: @stripclub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stripclubs/1
  # PATCH/PUT /stripclubs/1.json
  def update
    respond_to do |format|
      if @stripclub.update(stripclub_params)
        format.html { redirect_to @stripclub, notice: 'Stripclub was successfully updated.' }
        format.json { render :show, status: :ok, location: @stripclub }
      else
        format.html { render :edit }
        format.json { render json: @stripclub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stripclubs/1
  # DELETE /stripclubs/1.json
  def destroy
    @stripclub.destroy
    respond_to do |format|
      format.html { redirect_to stripclubs_url, notice: 'Stripclub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stripclub
      @stripclub = Stripclub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stripclub_params
      params.require(:stripclub).permit(:name, :location, :female_dancers, :male_dancers, :phone_number, :music)
    end
end
