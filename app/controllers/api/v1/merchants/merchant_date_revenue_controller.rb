class Api::V1::Merchants::MerchantDateRevenueController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.where("invoices.created_at = ?", "#{params["date"]}").joins(:invoice_items).sum("quantity * unit_price"), serializer: MerchantDateRevenueSerializer
  end

end
