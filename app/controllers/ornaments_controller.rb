class OrnamentsController < ApplicationController
  before_action :set_ornament, only: [:show, :edit, :update, :destroy]

  # GET /ornaments
  # GET /ornaments.json
  def index
    @ornaments = Ornament.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 150)
  end

  # GET /ornaments/1
  # GET /ornaments/1.json
  def show
  end

  # GET /ornaments/new
  def new
    @ornament = Ornament.new
  end

  # GET /ornaments/1/edit
  def edit
  end

  # POST /ornaments
  # POST /ornaments.json
  def create
    @ornament = Ornament.new(ornament_params)

    respond_to do |format|
      if @ornament.save
        format.html { redirect_to @ornament, notice: 'Ornament was successfully created.' }
        format.json { render :show, status: :created, location: @ornament }
      else
        format.html { render :new }
        format.json { render json: @ornament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ornaments/1
  # PATCH/PUT /ornaments/1.json
  def update
    respond_to do |format|
      if @ornament.update(ornament_params)
        format.html { redirect_to @ornament, notice: 'Ornament was successfully updated.' }
        format.json { render :show, status: :ok, location: @ornament }
      else
        format.html { render :edit }
        format.json { render json: @ornament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ornaments/1
  # DELETE /ornaments/1.json
  def destroy
    @ornament.destroy
    respond_to do |format|
      format.html { redirect_to ornaments_url, notice: 'Ornament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ornament
      @ornament = Ornament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ornament_params
      params.require(:ornament).permit(:user_id, :description)
    end
end
