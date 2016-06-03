class Api::V1::InvoiceItems::FinderController < ApplicationController
  respond_to :json

  def show
    if params[:unit_price]
      price = params[:unit_price].to_f * 100
      respond_with InvoiceItem.find_by(unit_price: price)
    else
      respond_with InvoiceItem.find_by(invoice_item_params)
    end
  end

  def index
    if params[:unit_price]
      price = params[:unit_price].to_f * 100
      respond_with InvoiceItem.where("unit_price = ?", "#{price.to_i}")
    else
      respond_with InvoiceItem.where(invoice_item_params)
    end
  end

  private

  def invoice_item_params
    params.permit(:id, :invoice_id, :item_id, :quantity, :created_at, :updated_at)
  end
end
