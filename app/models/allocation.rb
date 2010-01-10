require 'acts_as_currency'
class Allocation < ActiveRecord::Base
  extend ActsAsCurrency
  belongs_to :donation
  belongs_to :podcast
  acts_as_currency :amount
end
