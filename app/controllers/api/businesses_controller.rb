class API::BusinessesController < ApplicationController

  def index
    businesses = Business.all
    render json: businesses, status: 200
  end

end