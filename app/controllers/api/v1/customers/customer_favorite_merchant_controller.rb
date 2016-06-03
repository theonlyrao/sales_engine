class Api::V1::Customers::CustomerFavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.joins(:customers).where("customers.id = ?", "#{params["id"]}").joins(:transactions).where("result = ?", "success").group("merchants.id").order("sum(transactions.id) DESC").take(1).first
  end
end
    
    

