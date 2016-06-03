class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  respond_to :json
  
  def show
    merchant = Merchant.find(params[:id])
    if params[:date].nil?
      respond_with merchant.transactions.where("result = ?", "success").joins(:invoice_items).sum("quantity * unit_price"), serializer: MerchantRevenueSerializer
    else
      #merchant.joins(:invoices).where("created_at = ?", "#{params["date"]}").joins(:invoice_items).sum("quantity * unit_price")
    end
  end

  # def index
  #   num_results = params["quantity"].to_i
  #   ordered_array = Merchant.joins(:invoice_items).group("merchants.id").sum("quantity * unit_price").sort_by { |k,v| v }.to_a
  #   pairs = ordered_array.last(num_results)
  #   ids = pairs.map { |merchant_id, revenue| merchant_id }
  #   answer = ids.map { |id| Merchant.find(id) }.reverse
  #   respond_with answer
  # end

  def index
    respond_with Merchant.joins(:invoice_items).group("merchants.id").order("sum(quantity * unit_price) DESC").limit(params["quantity"])
  end
end
