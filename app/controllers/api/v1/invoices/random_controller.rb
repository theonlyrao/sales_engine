class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json
  
  def show
    respond_with Invoice.random_one
  end
end
