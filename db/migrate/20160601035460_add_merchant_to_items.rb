class AddMerchantToItems < ActiveRecord::Migration
  def change
    add_reference :items, :merchant, index: true, foreign_key: true
  end
end
