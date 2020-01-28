class Api::V1::PinsController < ApplicationController
  before_action :authenticate_with_http_token

  def index
    render json: Pin.all.order('created_at DESC')
  end

  def create
    pin = Pin.new(pin_params)
    if pin.save
      render json: pin, status: 201
    else
      render json: { errors: pin.errors }, status: 422
    end
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :image_url)
    end

    def authenticate_with_http_token
      email = request.headers['X-User-Email'].to_s
      token = request.headers['X-Api-Token'].to_s
      user = User.find_by_email(email)
      
      if !user.nil? 
        if user.api_token == token
          sign_in user
        end
      else
        head (:unauthorized)
      end
    end
end