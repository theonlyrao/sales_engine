class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :invoice_items, through: :invoice
end
