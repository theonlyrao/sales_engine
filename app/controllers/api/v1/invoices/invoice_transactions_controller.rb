class Api::V1::Invoices::InvoiceTransactionsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Invoice.find(params[:id]).transactions
  end
end
