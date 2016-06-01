require "rails_helper"

RSpec.describe "Index", type: :request do
  it "returns all customers" do
    get "/api/v1/customers.json"
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(20)
    expect(response.body).to include("Customer 0 First")
    expect(response.body).to include("Customer 10 First")
    expect(response.body).to include("Customer 19 First")
  end

  it "returns individual customer" do
    get "/api/v1/customers/1.json"
    first_name = Customer.find(1).first_name
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer 0 First")
    expect(first_name).to eq("Customer 0 First")
  end

  it "can find a single customer" do
    get "/api/v1/customers/find?id=3"
    first_name = Customer.find(3).first_name    
    expect(response.content_type).to eq("application/json")
    expect(first_name).to eq("Customer 2 First")    
    expect(response.body).to include("Customer 2 First")

    get "/api/v1/customers/find?first_name=Customer%202%20First"
    expect(response.body).to include("Customer 2 First")

    get "/api/v1/customers/find?last_name=Customer%202%20Last"
    expect(response.body).to include("Customer 2 First")

    time = "2016-05-31 16:57:31 UTC"
    customer = Customer.create!(first_name: "created_at_test", created_at: time)
    get "/api/v1/customers/find?created_at=2016-05-31%2016:57:31%20UTC"
    expect(response.body).to include(customer.first_name)
  end

  it "can find multiple customers" do
    get "/api/v1/customers/find_all?first_name=2"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer 2 First")
    expect(response.body).to include("Customer 12 First")
  end

  it "can find a random customer" do
    get "/api/v1/customers/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(parsed_response.class).to eq(Hash)        
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer")
  end
end
