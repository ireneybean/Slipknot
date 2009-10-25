class Donation < ActiveRecord::Base

  validates_numericality_of :amount_cents, :greater_than=>0
  def amount
    self.amount_cents.to_f/100
  end
  def amount=(val)
    self.amount_cents = val.to_f * 100
  end
  def self.human_attribute_name(column_name)
    if (column_name == "amount_cents")
      "Amount"
    else
      super
    end
  end
end
