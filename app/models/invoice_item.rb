class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def self.find_one(params)
    if params.keys.include?("unit_price")
      price = params[:unit_price].to_f * 100
      find_by(unit_price: price)
    else
      find_by(params)
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

  def self.random_one
    limit(1).order("RANDOM()")
  end
  
end
