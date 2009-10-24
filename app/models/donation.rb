class Donation < ActiveRecord::Base

  def amount
    self.amount_cents.to_f/100
  end
  def amount=(val)
    self.amount_cents = val.to_f * 100
  end
end
