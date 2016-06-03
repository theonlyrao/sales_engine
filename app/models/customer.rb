class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.find_one(params)
    find_by(params)
  end

  def self.find_many(params)
    where(params)
  end
end
