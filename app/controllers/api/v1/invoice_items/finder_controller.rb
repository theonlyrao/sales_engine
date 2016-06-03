class Api::V1::InvoiceItems::FinderController < ApplicationController
  respond_to :json
  
  def show
    if params.first.first == "id"
      respond_with InvoiceItem.find_by(id: params.first.last)
    elsif params.first.first == "invoice_id"
      respond_with InvoiceItem.find_by(invoice_id: params.first.last)
    elsif params.first.first == "item_id"
      respond_with InvoiceItem.find_by(item_id: params.first.last)
    elsif params.first.first == "quantity"
      respond_with InvoiceItem.find_by(quantity: params.first.last)
    elsif params.first.first == "unit_price"
      price = params[:unit_price].to_f * 100
      # respond_with Item.find_by(unit_price: price.ceil)
      respond_with InvoiceItem.where("unit_price = ?", "#{price.ceil}").order(:id).limit(1).first
    elsif params.first.first == "created_at"
      respond_with InvoiceItem.find_by(created_at: params.first.last)
    else
      respond_with InvoiceItem.find_by(updated_at: params.first.last)
    end
  end

  def index
    if params.first.first == "id"
      respond_with InvoiceItem.where("id = ?", "#{params.first.last}")
    elsif params.first.first == "invoice_id"
      respond_with InvoiceItem.where("invoice_id = ?", "#{params.first.last}")
     elsif params.first.first == "item_id"
      respond_with InvoiceItem.where("item_id = ?", "#{params.first.last}")
    elsif params.first.first == "unit_price"
      price = params[:unit_price].to_f * 100
      respond_with InvoiceItem.where("unit_price = ?", "#{price.to_i}")
    elsif params.first.first == "quantity"
      respond_with InvoiceItem.where("quantity = ?", "#{params.first.last}")
    elsif params.first.first == "created_at"
      respond_with InvoiceItem.where("created_at = ?", "#{params.first.last}")
    else
      respond_with InvoiceItem.where("updated_at = ?", "#{params.first.last}")
    end
  end
  
end
