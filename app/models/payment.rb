require 'acts_as_currency'
class Payment < ActiveRecord::Base
  extend ActsAsCurrency
  belongs_to :donation
  validates_presence_of :donation
  #validates_uniqueness_of :txn_id
  acts_as_currency :payment_gross, :payment_fee, :mc_gross, :mc_fee
end
