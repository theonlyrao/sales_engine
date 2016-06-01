class AddInvoiceToTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :invoice_id
    add_reference :transactions, :invoice, index: true, foreign_key: true
  end
end
