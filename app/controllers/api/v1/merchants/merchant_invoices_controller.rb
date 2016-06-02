class Api::V1::Merchants::MerchantInvoicesController < ApplicationController
  respond_to :json
  
  def index
    respond_with Merchant.find(params[:id]).invoices#, each_serializer: MerchantItemSerializer
  end
end
