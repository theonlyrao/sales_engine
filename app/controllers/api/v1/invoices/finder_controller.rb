class Api::V1::Invoices::FinderController < ApplicationController
  respond_to :json
  
  def show
    if params.first.first == "id"
      respond_with Invoice.find_by(id: params.first.last)
    elsif params.first.first == "customer_id"
      respond_with Invoice.find_by(customer_id: params.first.last)
    elsif params.first.first == "merchant_id"
      respond_with Invoice.find_by(merchant_id: params.first.last)
    elsif params.first.first == "status"
      respond_with Invoice.find_by(status: params.first.last)
    elsif params.first.first == "created_at"
      respond_with Invoice.find_by(created_at: params.first.last)
    else
      respond_with Invoice.find_by(updated_at: params.first.last)
    end
  end

  def index
    if params.first.first == "id"
      respond_with Invoice.where("id = ?", "#{params.first.last}")
    elsif params.first.first == "customer_id"
      respond_with Invoice.where("customer_id = ?", "#{params.first.last}")
     elsif params.first.first == "merchant_id"
      respond_with Invoice.where("merchant_id = ?", "#{params.first.last}")
    elsif params.first.first == "status"
      respond_with Invoice.where("status = ?", "#{params.first.last}")
    elsif params.first.first == "created_at"
      respond_with Invoice.where("created_at = ?", "#{params.first.last}")
    else
      respond_with Invoice.where("updated_at = ?", "#{params.first.last}")
    end
  end
  
end
