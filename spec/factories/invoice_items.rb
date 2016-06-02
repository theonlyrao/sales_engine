FactoryGirl.define do

  factory :invoice_item do
    item
    invoice
    sequence(:quantity) { |n| n }
    sequence(:unit_price) { |n| (n * 100) }
    sequence(:created_at) { |n| n.days.ago }
    sequence(:updated_at) { |n| n.days.ago }
  end


end
