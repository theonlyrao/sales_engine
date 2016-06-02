require 'rails_helper'

RSpec.describe "MerchantItemsController", type: :request do
  it "returns merchant with associated items" do
    merchant = create(:merchant)
    item_one = create(:item, merchant: merchant)
    item_two = create(:item, merchant: merchant)
    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(2)
    expect(response.body).to include("#{item_one.id}")
    expect(response.body).to include("#{item_one.merchant.id}")
    expect(response.body).to include("#{item_one.name}")
    expect(response.body).to include("#{item_one.description}")
    expect(response.body).to include("#{item_one.unit_price}")
    expect(response.body).not_to include("#{item_one.created_at}")
    expect(response.body).not_to include("#{item_one.updated_at}")
    
  end
end
