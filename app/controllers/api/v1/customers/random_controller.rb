class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json
  
  def show
    query = rand(1..Customer.count)
    respond_with Customer.find(query)
  end
end
