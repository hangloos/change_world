class API::BusinessesController < ApplicationController

  before_action :set_business, only: [:show, :update]

  def index
    businesses = Business.all
    render json: businesses, status: 200
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      render json: @business, status: 201
    else
      render_errors
    end
  end

  def show
      render json: @business, status: 200
  end

  def update
    if @business.update(business_params)
      render json: @business, status: 200
    else
      render_errors
    end
  end





  private

  def set_business
    @business = Business.find_by(id: params[:id])
    if !@business
      render json: {
        errors: {
          messages: { business: "can't be found"}
        }
      }, status: 404
    end
  end

  def render_errors
    render json: { 
          errors: { 
            messages: @business.errors.messages 
            } 
          }, status: 422
  end

  def business_params
    params.require(:business).permit(:name)
  end

end