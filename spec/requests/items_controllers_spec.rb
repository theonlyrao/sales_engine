require 'rails_helper'

RSpec.describe "ItemsControllers", type: :request do
  before(:each) do
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
    returned = Item.last
    get "/api/v1/items/#{returned.id}.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{returned.description}")
  end

  it "can find a single item" do
    item = create(:item, unit_price: 1234)
    get "/api/v1/items/find?id=#{item.id}"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include(item.description)

    get "/api/v1/items/find?unit_price=12.34"
    expect(response.body).to include(item.description)

    time = "2016-05-31 16:57:31 UTC"
    #item = Item.create!(description: "Finder works", updated_at: time, unit_price: 12345)
    item_one = create(:item, updated_at: time)
    #get "/api/v1/items/find?updated_at=2016-05-31T16:57:31.000Z"
    get "/api/v1/items/find?updated_at=#{time}"
    expect(response.body).to include("#{item_one.description}")

    time_two = "2015-06-19 16:57:31 UTC"
    #item = Item.create!(description: "Finder works", updated_at: time_two, unit_price: 12345)
    item_two = create(:item, created_at: time_two)
    #get "/api/v1/items/find?updated_at=2016-05-31T16:57:31.000Z"
    get "/api/v1/items/find?created_at=#{time_two}"
    expect(response.body).to include("#{item_two.description}")

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
    create(:item, unit_price: 3000)
    get "/api/v1/items/find_all?unit_price=30.00"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")    
  end
  
  it "can find a random invoice" do
    get "/api/v1/items/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Description for item")
  end



end
