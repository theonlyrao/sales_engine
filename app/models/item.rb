class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def convert_to_dollars
    self.unit_price = (self.unit_price.to_f) / 100
  end

  def self.find_one(params)
    if params[:unit_price]
      price = (params[:unit_price].to_f * 100).ceil
      find_by(unit_price: price)
    else
      Item.find_by(params)
    end
  end

  def self.find_all(params)
    if params[:unit_price]
      price = params[:unit_price].to_f * 100
      where("unit_price = ?", "#{price.to_i}")
    else
      where(params)
    end
  end

  def self.most_items_sold(number)
    joins(:invoice_items).group("items.id").order("sum(quantity) DESC").take(number)
  end

  def self.highest_revenue_generators(number)
    joins(:invoice_items).group("items.id").order("sum(quantity * items.unit_price) DESC").take(number)
  end

  def self.random_one
    limit(1).order("RANDOM()")
  end
  
end
