class Transaction < ActiveRecord::Base
  belongs_to :invoice
  has_many :invoice_items, through: :invoice

  #default_scope { where result: "success" }
end
