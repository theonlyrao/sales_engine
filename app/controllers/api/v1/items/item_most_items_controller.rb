class Api::V1::Items::ItemMostItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.joins(:invoice_items).group("items.id").order("sum(quantity) DESC").take(params["quantity"])
  end
end
