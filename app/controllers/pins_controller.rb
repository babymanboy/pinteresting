class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
    
  end


  def show
  end

  def new
    @pin = current_user.pins.build
  end


  def edit
  end


  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Ornament was successfully hung.'
    else
      render :new
    end
  end

 
  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Ornament was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    respond_to do |format|
      @pin.destroy
      format.html { redirect_to pins_url, notice: 'Ornament was successfully destroyed.' }
      end
    end
  end



  private

    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this ornament" if @pin.nil?
    end  

    def pin_params
      params.require(:pin).permit(:description, :image)
    end

