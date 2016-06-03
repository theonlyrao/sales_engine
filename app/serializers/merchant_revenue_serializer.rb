class MerchantRevenueSerializer < ActiveModel::Serializer
  attribute :revenue

  def revenue
    "#{(object.to_f/100)}"
  end
end
