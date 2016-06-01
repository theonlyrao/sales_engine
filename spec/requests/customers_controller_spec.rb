require "rails_helper"

RSpec.describe "Index", type: :request do
  it "returns all customers" do
    get "/api/v1/customers.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer 0 First")
    expect(response.body).to include("Customer 10 First")
    expect(response.body).to include("Customer 19 First")
  end

  it "returns individual customer" do
    get "/api/v1/customers/1.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer 0 First")
  end

  it "can find a single customer" do
    get "/api/v1/customers/find?id=3"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer 2 First")

    get "/api/v1/customers/find?first_name=Customer%202%20First"
    expect(response.body).to include("Customer 2 First")

    get "/api/v1/customers/find?last_name=Customer%202%20Last"
    expect(response.body).to include("Customer 2 First")
  end

  it "can find multiple customers" do
    get "/api/v1/customers/find_all?first_name=2"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer 2 First")
    expect(response.body).to include("Customer 12 First")
  end

  it "can find a random customer" do
    get "/api/v1/customers/random.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("Customer")
  end
end
