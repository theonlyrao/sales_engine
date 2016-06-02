require 'rails_helper'

RSpec.describe "InvoiceInvoiceItemsController", type: :request do
  it "returns invoice items associated with invoice" do
    invoice = create(:invoice)
    invoice_item_one = create(:invoice_item, invoice: invoice)
    invoice_item_two = create(:invoice_item, invoice: invoice)
    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(2)
    expect(response.body).to include("#{invoice_item_one.id}")
    expect(response.body).to include("#{invoice_item_one.invoice_id}")
    expect(response.body).to include("#{invoice_item_one.item_id}")
    expect(response.body).to include("#{invoice_item_one.quantity}")
    expect(response.body).not_to include("#{invoice_item_one.created_at}")
    expect(response.body).not_to include("#{invoice_item_one.updated_at}")
  end
end
