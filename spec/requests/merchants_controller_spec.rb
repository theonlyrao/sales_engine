require 'rails_helper'

RSpec.describe "MerchantsControllers", type: :request do
  before(:each) do
    5.times do
      create(:merchant)
    end
  end
  
  it "returns all merchants" do
    get "/api/v1/merchants.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(5)
  end
  
  it "returns individual merchant" do
    merchant = Merchant.last
    get "/api/v1/merchants/#{merchant.id}.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{merchant.name}")
  end

  it "can find a single merchant" do
    merchant = Merchant.last
    get "/api/v1/merchants/find?id=#{merchant.id}"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{merchant.name}")

    get "/api/v1/merchants/find?name=#{merchant.name}"
    expect(response.body).to include("#{merchant.id}")

    time = "2016-05-31 16:57:31 UTC"
    merchant = Merchant.create!(name: "found", updated_at: time)
    get "/api/v1/merchants/find?updated_at=2016-05-31T16:57:31.000Z"
    expect(response.body).to include("found")
  end

  it "can find multiple merchants" do
    new = create(:merchant, name: "Multiple")
    second = create(:merchant, name: "Multiple")
    get "/api/v1/merchants/find_all?name=Multiple"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
  end
  
  it "can find a random merchant" do
    get "/api/v1/merchants/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Merchant")
  end
end
