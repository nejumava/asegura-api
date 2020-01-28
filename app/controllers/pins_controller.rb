class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @pins = Pin.all.order('created_at DESC')
  end

  def new
    @pin = Pin.new
  end

  def create
    pin = Pin.new(pin_params)
    pin.user = current_user
    if pin.save
      redirect_to root_path, notice: "El pin fue creado exitosamente"
    else
      render :new
    end
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :image_url)
    end
end
