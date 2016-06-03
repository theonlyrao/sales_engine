require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should belong_to(:merchant) }
  it { should have_many(:invoice_items) }
  it { should have_many(:invoices).through(:invoice_items) }

  it "can convert unit_price to dollars" do
    item = create(:item, unit_price: 9984)
    expect(item.convert_to_dollars).to eq(99.84)
  end
end
