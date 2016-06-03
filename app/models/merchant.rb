class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def self.favorite_of_customer(customer_id)
    joins(:customers).where("customers.id = ?", "#{customer_id}").joins(:transactions).where("result = ?", "success").group("merchants.id").order("sum(transactions.id) DESC").take(1).first
  end

  def self.revenue_on_day(date)
    Invoice.where("invoices.created_at = ?", "#{date}").joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.revenue_by_one_merchant(merchant_id)
    find(merchant_id).transactions.where("result = ?", "success").joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.revenue_by_many_merchants(number)
    joins(:invoice_items).group("merchants.id").order("sum(quantity * unit_price) DESC").take(number)
  end

  def self.random_one
    limit(1).order("RANDOM()")
  end
end
