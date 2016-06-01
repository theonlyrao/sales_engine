class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json
  
  def show
    query = rand(1..Transaction.count)
    respond_with Transaction.find(query)
  end
end
