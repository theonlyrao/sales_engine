class Api::V1::Items::FinderController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find_one(item_params)
  end

  def index
    respond_with Item.find_all(item_params)
  end

  private
  
  def item_params
    params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
  end
end
