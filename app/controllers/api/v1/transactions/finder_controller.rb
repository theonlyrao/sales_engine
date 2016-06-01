class Api::V1::Transactions::FinderController < ApplicationController
  respond_to :json
  
  def show
    query = { params.first[0] => params.first[1] }
    if params.first[0] == "created_at" || params.first[0] == "updated_at"
      query = { params.first[0] => Time.zone.parse(params.first[1]) }
      respond_with Transaction.find_by(query)
    else
      respond_with Transaction.find_by(query)
    end
  end

  def index
    search_type = params.first.first
    query = params.first.last
    respond_with Transaction.where("#{search_type} LIKE ?", "%#{query}%")
  end
  
end