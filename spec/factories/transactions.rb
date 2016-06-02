FactoryGirl.define do

  factory :transaction do
    invoice
    sequence(:credit_card_number) { |n| n }
    sequence(:credit_card_expiration_date) { |n| n.months.ago }
    result "pending"
    sequence(:created_at) { |n| n.days.ago }
    sequence(:updated_at) { |n| n.days.ago }
  end


end
