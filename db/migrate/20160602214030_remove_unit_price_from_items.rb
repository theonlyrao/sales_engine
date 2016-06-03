class RemoveUnitPriceFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :unit_price
    add_column :items, :unit_price, :integer
  end
end
