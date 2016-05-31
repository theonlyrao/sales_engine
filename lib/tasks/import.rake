require 'csv'

desc "Import test data from csv file"
task :import => :environment do

  file = "db/data/stubs/rake_data.csv"

  CSV.foreach(file, :headers => true) do |row|
    Customer.create({
      first_name: row[1],
      last_name: row[2],
      created_at: row[3],
      updated_at: row[4],
    })
  end

  file = "db/data/stubs/rake_data_2.csv"

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

end
