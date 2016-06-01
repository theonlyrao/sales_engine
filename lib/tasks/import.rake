require 'csv'

desc "Import data from csv files"
task :import => :environment do

  puts "importing customers"
  file = "db/data/customers.csv"
  CSV.foreach(file, :headers => true) do |row|
    Customer.create({
      first_name: row[1],
      last_name: row[2],
      created_at: row[3],
      updated_at: row[4],
    })
  end

  puts "importing invoice_items"
  file = "db/data/invoice_items.csv"
  CSV.foreach(file, :headers => true) do |row|
    InvoiceItem.create({
      item_id: row[1],
      invoice_id: row[2],
      quantity: row[3],
      unit_price: row[4],
      created_at: row[5],
      updated_at: row[6]
    })
  end

  puts "importing invoices"
  file = "db/data/invoices.csv"
  CSV.foreach(file, :headers => true) do |row|
    Invoice.create({
      customer_id: row[1],
      merchant_id: row[2],
      status: row[3],
      created_at: row[4],
      updated_at: row[5]
    })
  end

  puts "importing items"
  file = "db/data/items.csv"
  CSV.foreach(file, :headers => true) do |row|
    Item.create({
      name: row[1],
      description: row[2],
      unit_price: row[3],
      merchant_id: row[4],
      created_at: row[5],
      updated_at: row[6]
    })
  end

  puts "importing merchants"
  file = "db/data/merchants.csv"
  CSV.foreach(file, :headers => true) do |row|
    Merchant.create({
      name: row[1],
      created_at: row[5],
      updated_at: row[6]
    })
  end

  puts "importing transactions"
  file = "db/data/transactions.csv"
  CSV.foreach(file, :headers => true) do |row|
    Transaction.create({
      invoice_id: row[1],
      credit_card_number: row[2],
      credit_card_expiration_date: row[3],
      result: row[4],
      created_at: row[5],
      updated_at: row[6]
    })
  end

end
