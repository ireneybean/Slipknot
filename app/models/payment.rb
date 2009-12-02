class Payment < ActiveRecord::Base
  include StoreAmountsAsCents
  belongs_to :donation
  validates_presence_of :donation
end
