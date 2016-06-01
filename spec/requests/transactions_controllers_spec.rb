require 'rails_helper'

RSpec.describe "TransactionsControllers", type: :request do
  it "returns all transactions" do
    get "/api/v1/transactions.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(23)
    expect(response.body).to include("1234")
  end
  
  it "returns individual transaction" do
    get "/api/v1/transactions/2.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("\"id\":2")
  end

  it "can find a single transaction" do
    transaction = Transaction.find(2)
    get "/api/v1/transactions/find?id=2"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include(transaction.credit_card_number)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"
    expect(response.body).to include("#{transaction.id}")

    time = "2016-05-31 16:57:31 UTC"
    transaction = Transaction.create!(credit_card_number: "09877", updated_at: time)
    get "/api/v1/transactions/find?updated_at=2016-05-31T16:57:31.000Z"
    expect(response.body).to include("09877")
  end

  it "can find multiple transactions" do
    get "/api/v1/transactions/find_all?credit_card_number=1"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(23)    
    expect(response.content_type).to eq("application/json")
  end
  
  it "can find a random invoice" do
    get "/api/v1/transactions/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(parsed_response.class).to eq(Hash)        
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("credit_card_expiration_date")
  end
end
