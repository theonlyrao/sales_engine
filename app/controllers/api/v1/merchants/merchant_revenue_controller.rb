class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  respond_to :json
  
  def show
    merchant = Merchant.find(params[:id])
    respond_with merchant.transactions.where("result = ?", "success").joins(:invoice_items).sum("quantity * unit_price")
  end
end
