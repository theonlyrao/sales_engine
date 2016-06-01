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

end
