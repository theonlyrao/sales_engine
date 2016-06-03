class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json
  
  def show
    respond_with Transaction.random_one
  end
end
