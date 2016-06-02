class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  #before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = self.unit_price / 100
  end
  
end
