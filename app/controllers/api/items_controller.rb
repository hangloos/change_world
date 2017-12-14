class API::ItemsController < ApplicationController

  before_action :set_business, only: [:index]

  def index
    render json: @business.items, status: 200
  end







  private

  def set_business
    @business = Business.find_by(id: params[:business_id])
    if !@business
      render json: {
        errors: {
          messages: { business: "can't be found"}
        }
      }, status: 404
    end
  end

end