class Api::V1::ItemsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    query = { params.first[0] => params.first[1] }
    if params.first[0] == "created_at" || params.first[0] == "updated_at"
      query = { params.first[0] => Time.zone.parse(params.first[1]) }
      respond_with Item.find_by(query)
    else
      respond_with Item.find_by(query)
    end
  end
end
