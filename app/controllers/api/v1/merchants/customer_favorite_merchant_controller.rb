class Api::V1::Merchants::CustomerFavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.favorite_of_customer(params["id"])
  end
end
    
    

