class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json
  
  def show
    respond_with InvoiceItem.random_one
  end
end
