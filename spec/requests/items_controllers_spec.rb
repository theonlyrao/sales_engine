require 'rails_helper'

RSpec.describe "ItemsControllers", type: :request do
  before(:all) do
    5.times do
      create(:item)
    end
  end
  
  it "returns all items" do
    get "/api/v1/items.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(5)
  end
  
  it "returns individual item" do
    get "/api/v1/items/4.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Description for item 5")
  end

  it "can find a single item" do
    item = Item.find(2)
    get "/api/v1/items/find?id=2"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include(item.description)

    get "/api/v1/items/find?unit_price=#{item.unit_price}"
    expect(response.body).to include(item.description)

    time = "2016-05-31 16:57:31 UTC"
    item = Item.create!(description: "Finder works", updated_at: time, unit_price: 12345)
    get "/api/v1/items/find?updated_at=2016-05-31T16:57:31.000Z"
    expect(response.body).to include("Finder works")
  end

  it "can find multiple items by description" do
    create(:item, description: "string")
    create(:item, description: "string")    
    get "/api/v1/items/find_all?description=string"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
  end

  it "can find multiple items by price" do
    create(:item, unit_price: 3000)
    get "/api/v1/items/find_all?unit_price=30.00"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")    
  end
  
  
  it "can find a random invoice" do
    get "/api/v1/items/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(parsed_response.class).to eq(Hash)        
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Description for item")
  end



end
