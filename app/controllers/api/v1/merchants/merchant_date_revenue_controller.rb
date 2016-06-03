class Api::V1::Merchants::MerchantDateRevenueController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.revenue_on_day(params["date"]), serializer: MerchantDateRevenueSerializer
  end

end
