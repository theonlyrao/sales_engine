class Merchant < ActiveRecord::Base
  has_many :invoices
end
