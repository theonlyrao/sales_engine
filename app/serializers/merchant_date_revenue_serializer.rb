class MerchantDateRevenueSerializer < ActiveModel::Serializer
  attribute :total_revenue

  def total_revenue
    "#{(object.to_f/100)}"
  end
end
