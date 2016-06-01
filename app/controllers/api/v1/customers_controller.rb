class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    query = { params.first[0] => params.first[1] }
    respond_with Customer.find_by(query)
  end

  def find_all
    respond_with Customer.where("first_name LIKE ?", "%#{params[:first_name]}%")
  end

  def random
    query = rand(1..Customer.count)
    respond_with Customer.find(query)
  end
end
