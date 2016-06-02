class MerchantItemSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :description, :name, :unit_price
end
