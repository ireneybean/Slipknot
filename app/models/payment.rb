require 'store_amounts_as_cents'
class Payment < ActiveRecord::Base
  extend StoreAmountsAsCents
  belongs_to :donation
  validates_presence_of :donation
  acts_as_currency :payment_gross
  acts_as_currency :payment_fee
  acts_as_currency :mc_gross
  acts_as_currency :mc_fee
end
