require 'rails_helper'

RSpec.describe "MerchantInvoicesControllers", type: :request do
  it "returns the invoices associated with a merchant" do
    merchant = create(:merchant)
    invoice_one = create(:invoice, merchant: merchant)
    invoice_two = create(:invoice, merchant: merchant)
    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(2)
    expect(response.body).to include("#{invoice_one.id}")
    expect(response.body).to include("#{invoice_one.merchant_id}")
    expect(response.body).to include("#{invoice_one.customer_id}")
    expect(response.body).to include("#{invoice_one.status}")
    expect(response.body).not_to include("#{invoice_one.created_at}")
    expect(response.body).not_to include("#{invoice_one.updated_at}")    
  end
end
