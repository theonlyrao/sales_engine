class Api::V1::Items::FinderController < ApplicationController
  respond_to :json
  
  def show
    if params.first.first == "id"
      respond_with Item.find_by(id: params.first.last)
    elsif params.first.first == "name"
      respond_with Item.find_by(name: params.first.last)
    elsif params.first.first == "description"
      respond_with Item.find_by(description: params.first.last)
    elsif params.first.first == "unit_price"
      respond_with Item.find_by(unit_price: params.first.last)
    elsif params.first.first == "merchant_id"
      respond_with Item.find_by(merchant_id: params.first.last)
    elsif params.first.first == "created_at"
      respond_with Item.where("created_at = ?", "#{params.first.last}").order(:id).limit(1).first
    else
      respond_with Item.where("updated_at = ?", "#{params.first.last}").order(:id).limit(1).first
    end
  end

  def index
    if params.first.first == "id"
      respond_with Item.where("id = ?", "#{params.first.last}")
    elsif params.first.first == "name"
      respond_with Item.where("name = ?", "#{params.first.last}")
     elsif params.first.first == "description"
      respond_with Item.where("description = ?", "#{params.first.last}")
    elsif params.first.first == "unit_price"
      respond_with Item.where("unit_price = ?", "#{params.first.last}")
    elsif params.first.first == "merchant_id"
      respond_with Item.where("merchant_id = ?", "#{params.first.last}")
    elsif params.first.first == "created_at"
      respond_with Item.where("created_at = ?", "#{params.first.last}")
    else
      respond_with Item.where("updated_at = ?", "#{params.first.last}")
    end
  end
  
end
