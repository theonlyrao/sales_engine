class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json
  
  def show
    query = rand(1..Invoice.count)
    respond_with Invoice.find(query)
  end
end
