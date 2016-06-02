class Api::V1::Items::RandomController < ApplicationController
  respond_to :json
  
  def show
    respond_with Item.limit(1).order("RANDOM()")
  end
end
