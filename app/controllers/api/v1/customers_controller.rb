class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    #query = { params.first[0] => params.first[1] }
    # if params.first[0] == "created_at" || params.first[0] == "updated_at"
    #   query = { params.first[0] => Time.zone.parse(params.first[1]) }
    #   respond_with Customer.find_by(query)
    # else
    attribute = params.first[0]
    value = params.first[1].to_json
    byebug
    respond_with Customer.find_by(attribute => value)
    #end
  end

  def find_all
    attribute = params.first[0]
    value = params.first[1].to_json
    respond_with Customer.where(attribute = value)
  end

  def random
    query = rand(1..Customer.count)
    respond_with Customer.find(query)
  end
end
