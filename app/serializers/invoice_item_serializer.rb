class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity
  attribute :unit_price

  def unit_price
    "#{object.unit_price.to_f / 100}"
  end

end
