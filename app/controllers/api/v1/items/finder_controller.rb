class Api::V1::Items::FinderController < ApplicationController
  respond_to :json

  def show
    if params[:unit_price]
      price = (params[:unit_price].to_f * 100).ceil
      respond_with Item.find_by(unit_price: price)
    else
      respond_with Item.find_by(item_params)
    end
  end

  def index
    if params[:unit_price]
      price = params[:unit_price].to_f * 100
      respond_with Item.where("unit_price = ?", "#{price.to_i}")
    else
      respond_with Item.where(item_params)
    end
  end

  private
  
  def item_params
    params.permit(:id, :name, :description, :merchant_id, :created_at, :updated_at)
  end
end
