require 'store_amounts_as_cents'
class Donation < ActiveRecord::Base
  extend StoreAmountsAsCents
  acts_as_currency :amount
  has_many :payments
  validates_numericality_of :amount_cents, :greater_than=>0

  
  def self.human_attribute_name(column_name)
    if (column_name == "amount_cents")
      "Amount"
    else
      super
    end
  end

end
