require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to(:item) }
  it { should belong_to(:invoice) }

  it "has a price in dollars and cents" do
    raw_price = "12492"
    item = InvoiceItem.create(unit_price: raw_price)

    expect(item.unit_price).to eq(124.92)
  end
  
end
