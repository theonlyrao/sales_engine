class RemoveUnitPriceFromInvoiceItems < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :unit_price
    add_column :invoice_items, :unit_price, :integer
  end
end
