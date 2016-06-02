class Api::V1::Merchants::FinderController < ApplicationController
  respond_to :json
  
  def show
    if params.first.first == "id"
      respond_with Merchant.find_by(id: params.first.last)
    elsif params.first.first == "name"
      respond_with Merchant.find_by(name: params.first.last)
    elsif params.first.first == "created_at"
      respond_with Merchant.find_by(created_at: params.first.last)
    else
      respond_with Merchant.find_by(updated_at: params.first.last)
    end
  end

  def index
    if params.first.first == "id"
      respond_with Merchant.where("id = ?", "#{params.first.last}")
    elsif params.first.first == "name"
      respond_with Merchant.where("name = ?", "#{params.first.last}")
    elsif params.first.first == "created_at"
      respond_with Merchant.where("created_at = ?", "#{params.first.last}")
    else
      respond_with Merchant.where("updated_at = ?", "#{params.first.last}")
    end
  end
  
end
