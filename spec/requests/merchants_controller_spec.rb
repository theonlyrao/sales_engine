require 'rails_helper'

RSpec.describe "MerchantsControllers", type: :request do
  it "returns all merchants" do
    get "/api/v1/merchants.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(10)
    expect(response.body).to include("Merchant 1")
  end
  
  it "returns individual merchant" do
    get "/api/v1/merchants/2.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("\"id\":2")
  end

  it "can find a single merchant" do
    merchant = Merchant.find(2)
    get "/api/v1/merchants/find?id=2"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include(merchant.name)

    get "/api/v1/merchants/find?name=#{merchant.name}"
    expect(response.body).to include("#{merchant.id}")

    time = "2016-05-31 16:57:31 UTC"
    merchant = Merchant.create!(name: "found", updated_at: time)
    get "/api/v1/merchants/find?updated_at=2016-05-31T16:57:31.000Z"
    expect(response.body).to include("found")
  end

  it "can find multiple merchants" do
    get "/api/v1/merchants/find_all?name=merch"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(10)    
    expect(response.content_type).to eq("application/json")
  end
  
  it "can find a random invoice" do
    get "/api/v1/merchants/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(parsed_response.class).to eq(Hash)        
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Merchant")
  end
end
