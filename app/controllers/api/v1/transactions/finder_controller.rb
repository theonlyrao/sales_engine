class Api::V1::Transactions::FinderController < ApplicationController
  respond_to :json
  
  def show
    if params.first.first == "id"
      respond_with Transaction.find_by(id: params.first.last)
    elsif params.first.first == "invoice_id"
      respond_with Transaction.find_by(invoice_id: params.first.last)
    elsif params.first.first == "credit_card_number"
      respond_with Transaction.find_by(credit_card_number: params.first.last)
    elsif params.first.first == "credit_card_expiration_date"
      respond_with Transaction.find_by(credit_card_expiration_date: params.first.last)
    elsif params.first.first == "result"
      respond_with Transaction.find_by(result: params.first.last)
    elsif params.first.first == "created_at"
      respond_with Transaction.find_by(created_at: params.first.last)
    else
      respond_with Transaction.find_by(updated_at: params.first.last)
    end
  end

  def index
    if params.first.first == "id"
      respond_with Transaction.where("id = ?", "#{params.first.last}")
    elsif params.first.first == "invoice_id"
      respond_with Transaction.where("invoice_id = ?", "#{params.first.last}")
     elsif params.first.first == "credit_card_number"
      respond_with Transaction.where("credit_card_number = ?", "#{params.first.last}")
    elsif params.first.first == "credit_card_expiration_date"
      respond_with Transaction.where("credit_card_expiration_date = ?","#{params.first.last}")
    elsif params.first.first == "result"
      respond_with Transaction.where("result = ?", "#{params.first.last}")
    elsif params.first.first == "created_at"
      respond_with Transaction.where("created_at = ?", "#{params.first.last}")
    else
      respond_with Transaction.where("updated_at = ?", "#{params.first.last}")
    end
  end
  
end
