require 'rails_helper'

RSpec.describe "InvoiceItemsControllers", type: :request do
  before(:each) do
    5.times do
      create(:invoice_item)
    end
  end
  
  it "returns all invoice_items" do
    get "/api/v1/invoice_items.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(5)
  end
  
  it "returns individual invoice_item" do
    instance = InvoiceItem.last
    get "/api/v1/invoice_items/#{instance.id}.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{instance.quantity}")
  end

  it "can find a single invoice_item" do
    invoice_item = create(:invoice_item, unit_price: 2345)
    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include(invoice_item.quantity.to_s)

    get "/api/v1/invoice_items/find?unit_price=23.45"
    expect(response.body).to include(invoice_item.id.to_s)

    time = "2016-05-31 16:57:31 UTC"
    invoice_item = InvoiceItem.create!(updated_at: time, unit_price: 23423)
    get "/api/v1/invoice_items/find?updated_at=2016-05-31T16:57:31.000Z"
    expect(response.body).to include("234.23")

    get "/api/v1/invoice_items/find?unit_price=234.23"
    expect(response.body).to include("234.23")
  end

  it "can find multiple invoice_items" do
    create(:invoice_item, quantity: 3203)
    create(:invoice_item, quantity: 3203)
    get "/api/v1/invoice_items/find_all?quantity=3203"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
  end
  
  it "can find a random invoice" do
    get "/api/v1/invoice_items/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("invoice_id")
    expect(response.body).to include("unit_price")    
  end
end
