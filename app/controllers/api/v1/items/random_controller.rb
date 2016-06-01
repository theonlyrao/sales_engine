class Api::V1::Items::RandomController < ApplicationController
  respond_to :json
  
  def show
    query = rand(1..Item.count)
    respond_with Item.find(query)
  end
end
