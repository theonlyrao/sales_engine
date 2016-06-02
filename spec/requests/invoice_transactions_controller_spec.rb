require 'rails_helper'

RSpec.describe "InvoiceTransactionsController", type: :request do
  it "returns transactions associated with invoice" do
    invoice = create(:invoice)
    transaction_one = create(:transaction, invoice: invoice)
    transaction_two = create(:transaction, invoice: invoice)
    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(2)
    expect(response.body).to include("#{transaction_one.id}")
    expect(response.body).to include("#{transaction_one.invoice_id}")
    expect(response.body).to include("#{transaction_one.credit_card_number}")
    expect(response.body).not_to include("#{transaction_one.credit_card_expiration_date}")
    expect(response.body).to include("#{transaction_one.result}")
    expect(response.body).not_to include("#{transaction_one.created_at}")
    expect(response.body).not_to include("#{transaction_one.updated_at}")
  end
end
