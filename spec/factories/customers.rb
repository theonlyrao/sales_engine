FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }    
    sequence(:created_at) { |n| n.days.ago }
    sequence(:updated_at) { |n| n.days.ago }
  end
end
