FactoryGirl.define do

  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description for item #{n}" }
    sequence(:unit_price) { |n| (n * 1000) }
    sequence(:created_at) { |n| n.days.ago }
    sequence(:updated_at) { |n| n.days.ago }
    merchant
  end


end
