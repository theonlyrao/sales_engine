require 'rails_helper'

RSpec.describe "CustomerFavoriteMerchants", type: :request do
  it "knows a customer's favorite merchant" do
    gold = create(:merchant)
    silver = create(:merchant)
    customer = create(:customer)
    invoice_one = create(:invoice, customer_id: customer.id, merchant_id: gold.id)
    invoice_two = create(:invoice, customer_id: customer.id, merchant_id: gold.id)
    invoice_three = create(:invoice, customer_id: customer.id, merchant_id: silver.id)
    transaction_one = create(:transaction, result: "success", invoice_id: invoice_one.id)
    transaction_two = create(:transaction, result: "success", invoice_id: invoice_two.id)
    transaction_three = create(:transaction, result: "success", invoice_id: invoice_three.id)
    get "/api/v1/customers/#{customer.id}/favorite_merchant"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.class).to eq(Hash)
    expect(response.body).to include(gold.id.to_s)
    expect(response.body).not_to include(silver.id.to_s)
  end
end
