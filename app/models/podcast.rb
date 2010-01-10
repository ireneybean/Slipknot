class Podcast  < ActiveRecord::Base
  has_many :allocations
  has_many :donations, :through => :allocations
end
