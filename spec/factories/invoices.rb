FactoryGirl.define do

  factory :invoice do
    customer
    merchant
    status "pending"
    sequence(:created_at) { |n| n.days.ago }
    sequence(:updated_at) { |n| n.days.ago }
  end


end
