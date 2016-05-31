class Item < ActiveRecord::Base
  belongs_to :merchant
  before_save :convert_to_dollars

  def convert_to_dollars
    self.unit_price = self.unit_price / 100
  end
  
end
