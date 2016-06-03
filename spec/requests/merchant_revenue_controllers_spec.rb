require 'rails_helper'

RSpec.describe "MerchantRevenueControllers", type: :request do
  it "knows total revenue for merchant" do
    merchant = create(:merchant)
    first_item = create(:item, merchant_id: merchant.id)
    second_item = create(:item, merchant_id: merchant.id)
    first_invoice = create(:invoice, merchant_id: merchant.id)
    second_invoice = create(:invoice, merchant_id: merchant.id)
    first_transaction = create(:transaction, result: "success", invoice_id: first_invoice.id)
    second_transaction = create(:transaction, result: "success", invoice_id: second_invoice.id)
    first_invoice_item = create(:invoice_item, item_id: first_item.id, invoice_id: first_invoice.id, quantity: 1, unit_price: 3001)
    second_invoice_item = create(:invoice_item, item_id: second_item.id, invoice_id: second_invoice.id, quantity: 1,  unit_price: 1000)
    get "/api/v1/merchants/#{merchant.id}/revenue"

    parsed_response = JSON.parse(response.body)
    expect(parsed_response).to include({"revenue" => "40.01"})
  end
end
