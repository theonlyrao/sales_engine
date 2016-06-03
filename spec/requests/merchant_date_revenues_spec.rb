require 'rails_helper'

RSpec.describe "MerchantDateRevenues", type: :request do
  it "knows how much merchant made on a date" do
    date = "2012-03-16 11:55:05"
    invoice_one = create(:invoice, created_at: date)
    invoice_two = create(:invoice, created_at: date)
    inv_item_one = create(:invoice_item, invoice_id: invoice_one.id, quantity: 1, unit_price: 502)
    inv_item_two = create(:invoice_item, invoice_id: invoice_two.id, quantity: 2, unit_price: 1000)
    get "/api/v1/merchants/revenue?date=#{date}"
    expect(response.body).to include("25.02")
  end
end
