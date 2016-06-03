class Api::V1::Items::ItemMostItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.most_items_sold(params["quantity"])
  end
end
