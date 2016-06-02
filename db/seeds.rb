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
    create_transactions
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
        merchant_id: (n % 10),
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
        merchant_id: n + 1,
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end    
  end

  def create_transactions
    puts "Creating transactions"
    invoice_count = Invoice.count
    (invoice_count - 2).times do |n|
      Transaction.create!(
        invoice_id: n + 1,
        credit_card_number: "1234",
        credit_card_expiration_date: "08/2015",
        result: "success",
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end
    Transaction.create!(
      invoice_id: invoice_count - 1,
      credit_card_number: "1234",
      credit_card_expiration_date: "08/2015",
      result: "pending",
      created_at: 30.days.ago,
      updated_at: 30.days.ago
    )
    Transaction.create!(
      invoice_id: invoice_count,
      credit_card_number: "1234",
      credit_card_expiration_date: "08/2015",
      result: "pending",
      created_at: 29.days.ago,
      updated_at: 29.days.ago
    )
  end

  def create_invoice_items
    "Creating Invoice Items"
    num_invoices = Invoice.count
    (num_invoices + 10).times do |n|
      InvoiceItem.create!(
        item_id: n + 1,
        invoice_id: n % num_invoices,
        quantity: n,
        unit_price: n * Item.find(n + 1).unit_price,
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end
  end

  def create_extras
    Merchant.find(1).invoices << Invoice.create!(
        customer_id: 1,
        status: "status",
        created_at: 12.days.ago,
        updated_at: 12.days.ago
    )
    Transaction.create!(
      invoice_id: Invoice.last,
      credit_card_number: "1234",
      credit_card_expiration_date: "08/1030",
      result: "success",
      created_at: 12.days.ago,
      updated_at: 12.days.ago
    )
    Merchant.find(2).invoices << Invoice.create!(
        customer_id: 1,
        status: "status",
        created_at: 12.days.ago,
        updated_at: 12.days.ago
    )
    Transaction.create!(
      invoice_id: Invoice.last,
      credit_card_number: "1234",
      credit_card_expiration_date: "08/1030",
      result: "success",
      created_at: 12.days.ago,
      updated_at: 12.days.ago
    )
    Merchant.find(2).invoices << Invoice.create!(
        customer_id: 1,
        status: "status",
        created_at: 12.days.ago,
        updated_at: 12.days.ago
    )
    Transaction.create!(
      invoice_id: Invoice.last,
      credit_card_number: "1234",
      credit_card_expiration_date: "08/1030",
      result: "success",
      created_at: 12.days.ago,
      updated_at: 12.days.ago
    )
    3.times do |n|
      InvoiceItem.create!(
        item_id: n + 1,
        invoice_id: Invoice.find(Invoice.count-n),
        quantity: n + 1,
        unit_price: n + 1 * Item.find(n + 1).unit_price,
        created_at: n.days.ago,
        updated_at: n.days.ago
      )
    end
  end
end


CreateData.new
