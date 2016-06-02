require "rails_helper"

RSpec.describe "customer controller", type: :request do
  before(:each) do
    5.times do
      create(:customer)
    end
  end
  
  it "returns all customers" do
    get "/api/v1/customers.json"
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(5)
    expect(response.body).to include("#{Customer.last.first_name}")
  end

  it "returns individual customer" do
    customer = Customer.last
    get "/api/v1/customers/#{customer.id}.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{customer.first_name}")
    expect(response.body).to include("#{customer.last_name}")
  end

  it "can find a single customer" do
    customer = Customer.last
    get "/api/v1/customers/find?id=#{customer.id}"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{customer.first_name}")
    expect(response.body).to include("#{customer.last_name}")
    
    get "/api/v1/customers/find?first_name=#{customer.first_name}"
    expect(response.body).to include("#{customer.last_name}")

    get "/api/v1/customers/find?last_name=#{customer.last_name}"
    expect(response.body).to include("#{customer.first_name}")

    time = "2016-05-31 16:57:31 UTC"
    timer = Customer.create!(first_name: "created_at_test", created_at: time)
    get "/api/v1/customers/find?created_at=2016-05-31%2016:57:31%20UTC"
    expect(response.body).to include(timer.first_name)
  end

  it "can find multiple customers" do
    original = create(:customer, first_name: "copy")
    customer = create(:customer, first_name: "copy")
    get "/api/v1/customers/find_all?first_name=copy"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{original.last_name}")
    expect(response.body).to include("#{customer.last_name}")
  end

  it "can find a random customer" do
    get "/api/v1/customers/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(parsed_response.class).to eq(Hash)        
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("First")
  end
end
