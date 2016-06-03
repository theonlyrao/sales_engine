class Api::V1::InvoiceItems::FinderController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find_one(invoice_item_params)
  end

  def index
    respond_with InvoiceItem.find_all(invoice_item_params)
  end

  private

  def invoice_item_params
    params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
