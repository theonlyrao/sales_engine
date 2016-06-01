class Api::V1::InvoicesController < ApplicationController
  respond_to :json
  
  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    query = { params.first[0] => params.first[1] }
    if params.first[0] == "created_at" || params.first[0] == "updated_at"
      query = { params.first[0] => Time.zone.parse(params.first[1]) }
      respond_with Invoice.find_by(query)
    else
      respond_with Invoice.find_by(query)
    end
  end
  
  def find_all
    search_type = params.first.first
    query = params.first.last
    respond_with Invoice.where("#{search_type} LIKE ?", "%#{query}%")
  end

  def random
    query = rand(1..Invoice.count)
    respond_with Invoice.find(query)
  end


end
