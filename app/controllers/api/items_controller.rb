class API::ItemsController < ApplicationController

  before_action :set_business, only: [:index, :create, :destroy]
  before_action :set_item, only: [:destroy]

  def index
    render json: @business.items, status: 200
  end

  def create
    @item = @business.items.build(item_params)
    if @item.save
      render json: @item, status: 201
    else
      render_errors
    end
  end

  def destroy
    @item.destroy
    :no_content
  end







  private


  def item_params
    params.require(:business).permit(:name, :price, :type)
  end

  def render_errors
    render json: { 
          errors: { 
            messages: @item.errors.messages 
            } 
          }, status: 422
  end

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

  def set_item
    @item = @business.items.find_by(id: params[:id])
    if !@item
      render json: {
        errors: {
          messages: { item: "can't be found"}
        }
      }, status: 404
    end
  end




end