require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:merchant) }
  it "has a price in dollars and cents" do
    raw_price = "12492"
    item = Item.create(unit_price: raw_price)

    expect(item.unit_price).to eq(124.92)
  end
end
