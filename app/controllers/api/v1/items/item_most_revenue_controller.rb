class Api::V1::Items::ItemMostRevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Item.highest_revenue_generators(params["quantity"])
  end
end
