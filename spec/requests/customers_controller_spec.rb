require "rails_helper"

RSpec.describe "Index", type: :request do
  before(:all) do
    5.times do
      create(:customer)
    end
  end
  
  it "returns all customers" do
    get "/api/v1/customers.json"
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(6)
    expect(response.body).to include("First1")
    expect(response.body).to include("First3")
    expect(response.body).to include("First6")
  end

  it "returns individual customer" do
    get "/api/v1/customers/1.json"
    customer = Customer.find(1)
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{customer.first_name}")
    expect(response.body).to include("#{customer.last_name}")
  end

  it "can find a single customer" do
    get "/api/v1/customers/find?id=3"
    customer = Customer.find(3)
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{customer.first_name}")
    expect(response.body).to include("#{customer.last_name}")
    
    get "/api/v1/customers/find?first_name=First4"
    expect(response.body).to include("Last4")

    get "/api/v1/customers/find?last_name=Last5"
    expect(response.body).to include("First5")

    time = "2016-05-31 16:57:31 UTC"
    customer = Customer.create!(first_name: "created_at_test", created_at: time)
    get "/api/v1/customers/find?created_at=2016-05-31%2016:57:31%20UTC"
    expect(response.body).to include(customer.first_name)
  end

  it "can find multiple customers" do
    original = Customer.find(2)
    customer = create(:customer, first_name: "First2")
    get "/api/v1/customers/find_all?first_name=First2"
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
