class Payment < ActiveRecord::Base
  belongs_to :donation
  validates_presence_of :donation
end
