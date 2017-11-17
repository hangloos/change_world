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
    business = Business.find_by(id: params[:id])
    if business
      render json: business, status: 200
    else
      render json: { 
          errors: { 
              messages: {business: "can't be found"}
            } 
          }, status: 404
    end
  end





  private

  def business_params
    params.require(:business).permit(:name)
  end

end