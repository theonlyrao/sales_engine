class Api::V1::Merchants::MerchantItemsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Merchant.find(params[:id]).items, each_serializer: MerchantItemSerializer
  end
end
