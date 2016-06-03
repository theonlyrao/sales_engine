class Api::V1::Items::ItemMostRevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Item.joins(:invoice_items).group("items.id").order("sum(quantity * items.unit_price) DESC").limit(params["quantity"])
  end
end
