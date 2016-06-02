require 'rails_helper'

RSpec.describe "InvoicesControllers", type: :request do
  before(:each) do
    5.times do
      create(:invoice)
    end
  end
  
  it "returns all invoices" do
    get "/api/v1/invoices.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(5)
  end

  it "returns individual invoice" do
    invoice = Invoice.last
    customer = invoice.customer
    get "/api/v1/invoices/#{invoice.id}.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{customer.id}")
  end

  it "can find a single invoice" do
    customer = Invoice.find(3).customer
    merchant = Invoice.find(3).merchant
    get "/api/v1/invoices/find?id=3"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{customer.id}")

    get "/api/v1/invoices/find?customer_id=#{customer.id}"
    expect(response.body).to include("3")

    get "/api/v1/invoices/find?merchant_id=#{merchant.id}"
    expect(response.body).to include("3")

    time = "2016-05-31 16:57:31 UTC"
    invoice = Invoice.create!(customer_id: customer.id, updated_at: time)
    get "/api/v1/invoices/find?updated_at=2016-05-31T16:57:31.000Z"
    expect(response.body).to include("#{invoice.id}")
  end

  it "can find multiple invoices" do
    customer = Customer.create()
    customer.invoices << [create(:invoice), create(:invoice)]
    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
  end
  
  it "can find a random invoice" do
    get "/api/v1/invoices/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("id")
  end

  
end
