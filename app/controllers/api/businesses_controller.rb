class API::BusinessesController < ApplicationController

  def index
    businesses = Business.all
    render json: businesses, status: 200
  end

  def create
    business = Business.new(business_params)
    if business.save
      render json: business, status: 201
    end
  end





  private

  def business_params
    params.require(:business).permit(:name)
  end

end