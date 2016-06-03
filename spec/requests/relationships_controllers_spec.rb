require 'rails_helper'

RSpec.describe "RelationshipsControllers", type: :request do
  it "won't accept a bad method" do
    get "/api/v1/transactions/1/delete"
    expect(response.body).to eq("null")
  end
end
