require 'rails_helper'

RSpec.describe "TransactionsControllers", type: :request do
  before(:each) do
    5.times do
      create(:transaction)
    end
  end
  
  it "returns all transactions" do
    get "/api/v1/transactions.json"
    expect(response).to have_http_status(200)
    parsed_response = JSON.parse(response.body)
    expect(response.content_type).to eq("application/json")
    expect(parsed_response.count).to eq(5)
  end
  
  it "returns individual transaction" do
    transaction = Transaction.last
    get "/api/v1/transactions/#{transaction.id}.json"
    expect(response.content_type).to eq("application/json")
    expect(response.body).to include("#{transaction.id}")
  end

  it "can find a single transaction" do
    transaction = Transaction.last
    get "/api/v1/transactions/find?id=#{transaction.id}"
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
    create(:transaction, credit_card_number: 1123234)
    create(:transaction, credit_card_number: 1123234)    
    get "/api/v1/transactions/find_all?credit_card_number=1123234"
    parsed_response = JSON.parse(response.body)
    expect(parsed_response.count).to eq(2)    
    expect(response.content_type).to eq("application/json")
  end
  
  it "can find a random invoice" do
    get "/api/v1/transactions/random.json"
    parsed_response = JSON.parse(response.body)    
    expect(response.content_type).to eq("application/json")
  end
end
