class Api::V1::Invoices::InvoiceRelationshipsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Invoice.find(params[:id]).send(params[:objects])
  end

end
