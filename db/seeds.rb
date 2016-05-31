# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class CreateData
  def initialize
    create_customers(20)
    create_merchants(10)
    create_items(30)
    create_invoices(20)
    create_transcations
    create_invoice_items
    create_extras
  end

  def create_customers(number)
    puts "Creating #{number} customers"
    number.times do |n|
      Customer.create!(
        first_name: "Customer #{n} First",
        last_name: "Customer #{n} Last",
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end
  end

  def create_merchants(number)
    puts "Creating #{number} merchants"
    number.times do |n|
      Merchant.create!(
        name: "Merchant #{n}",
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end    
  end

  def create_invoices(number)
    puts "Creating #{number} invoices"
    number.times do |n|
      Invoice.create!(
        customer_id: n,
        merchant_id: n % 10,
        status: "status",
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end    
  end

    def create_items(number)
    puts "Creating #{number} items"
    number.times do |n|
      Item.create!(
        name: "Item #{n}",
        description: "Description of item #{n}",
        unit_price: (n * 100) + ((n-2) * 10) + (n+8),
        merchant_id: n,
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end    
  end

  
end

CreateData.new
