class Api::V1::Customers::FinderController < ApplicationController
  respond_to :json
  
  def show
    if params.first.first == "id"
      respond_with Customer.find_by(id: params.first.last)
    elsif params.first.first == "first_name"
      respond_with Customer.find_by(first_name: params.first.last)
    elsif params.first.first == "last_name"
      respond_with Customer.find_by(last_name: params.first.last)
    elsif params.first.first == "created_at"
      respond_with Customer.find_by(created_at: params.first.last)
    else
      respond_with Customer.find_by(updated_at: params.first.last)
    end
  end

  def index
    if params.first.first == "id"
      respond_with Customer.where("id = ?", "#{params.first.last}")
    elsif params.first.first == "first_name"
      respond_with Customer.where("first_name = ?", "#{params.first.last}")
    elsif params.first.first == "last_name"
      respond_with Customer.where("last_name = ?", "#{params.first.last}")      
    elsif params.first.first == "created_at"
      respond_with Customer.where("created_at = ?", "#{params.first.last}")
    else
      respond_with Customer.where("updated_at = ?", "#{params.first.last}")
    end
  end
  
end
