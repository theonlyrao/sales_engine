class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :unit_price
      t.references :merchant, index: true, foreign_key:true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
