FactoryGirl.define do
  factory :merchant do
    sequence(:name) { |n| "Merchant#{n}" }
    sequence(:created_at) { |n| n.days.ago }
    sequence(:updated_at) { |n| n.days.ago }
  end
end
