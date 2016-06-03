class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :invoice_items, through: :invoice

  def self.random_one
    limit(1).order("RANDOM()")
  end
end
