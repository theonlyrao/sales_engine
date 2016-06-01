class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json
  
  def show
    query = rand(1..Merchant.count)
    respond_with Merchant.find(query)
  end
end
