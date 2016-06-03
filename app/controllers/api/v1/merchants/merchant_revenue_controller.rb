class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  respond_to :json
  
  def show
    respond_with Merchant.revenue_by_one_merchant(params[:id]), serializer: MerchantRevenueSerializer
  end

  def index
    respond_with Merchant.revenue_by_many_merchants(params["quantity"])
  end
end
