class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json
  
  def show
    query = rand(1..InvoiceItem.count)
    respond_with InvoiceItem.find(query)
  end
end
