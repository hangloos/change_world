class API::BusinessesController < ApplicationController

  def index
    businesses = Business.all
    render json: businesses, status: 200
  end

  def create
    business = Business.new(business_params)
    if business.save
      render json: business, status: 201
    else
      render json: { 
          errors: 
            { messages:
                  business.errors.messages 
            } }, status: 422
    end
  end

  def show
    set_business
    if @business
      render json: @business, status: 200
    else
      render json: { 
          errors: { 
              messages: {business: "can't be found"}
            } 
          }, status: 404
    end
  end

  def update
    set_business
    if @business
      @business.update(business_params)
      render json: @business, status: 200
    else
      render json: {
          errors: {
            messages: {business: "can't be found"}
          }
      }, status: 404
    end
  end





  private

  def set_business
    @business = Business.find_by(id: params[:id])
  end

  def business_params
    params.require(:business).permit(:name)
  end

end