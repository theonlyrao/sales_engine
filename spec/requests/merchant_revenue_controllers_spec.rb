require 'rails_helper'

RSpec.describe "MerchantRevenueControllers", type: :request do
  it "knows total revenue for merchant" do
    merchant = create(:merchant)
    first_invoice = create(:invoice, merchant_id: merchant)
    second_invoice = create(:invoice, merchant_id: merchant)
    # first_invoice.transactions << create(:transaction, result: "success")
    # second_invoice.transactions << create(:transaction, result: "success")
    # first_invoice.invoice_items << create(:invoice_item, unit_price: 3000)
    # second_invoice.invoice_items << create(:invoice_item, unit_price: 1000)
    #merchant.invoices << [first_invoice, second_invoice]
    first_transaction = create(:transaction, invoice_id: first_invoice)
    second_transaction = create(:transaction, invoice_ids: second_invoice)
    get "/api/v1/merchants/#{merchant.id}/revenue"
    expect(response.body).to include(40.00)
  end
end
