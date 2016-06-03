module Relationship

  def self.create(class_name, instance_id, object_name)
    class_name.capitalize.camelcase.chomp("s").constantize.find(instance_id).send(object_name) if valid_methods.include?(object_name.to_sym)
  end

  private

  def self.valid_methods
    [ :id,
      :invoice_id,
      :credit_card_number,
      :credit_card_expiration_date,
      :result,
      :created_at,
      :updated_at,
      :item_id,
      :quantity,
      :unit_price,
      :customer_id,
      :merchant_id,
      :status,
      :first_name,
      :last_name,
      :name,
      :description,
      :transaction,
      :transactions,
      :invoice_item,
      :invoice_items,
      :invoice,
      :invoices,
      :customer,
      :customers,
      :merchant,
      :merchants,
      :item,
      :items
    ]
    
  end
end
