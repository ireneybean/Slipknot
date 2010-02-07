require 'acts_as_currency'
class Donation < ActiveRecord::Base
  extend ActsAsCurrency
  acts_as_currency :amount
  has_many :payments
  has_many :allocations
  has_many :podcasts, :through => :allocations
  validates_numericality_of :amount_cents, :greater_than=>0
  validates_presence_of :podcast_ids  
  after_save :update_podcasts

  attr_accessor :podcast_ids
  
  def initialize(*args)
    super
    self.podcasts = Podcast.find(:all)
    
  end

  #after_save callback to handle podcast_ids
  def update_podcasts
    unless podcast_ids.nil?
      self.allocations.clear
      podcast_ids.each do |p|
        self.allocations.create(:podcast_id => p, :amount_cents=> self.amount_cents/podcast_ids.length) unless p.blank?
      end
      #apply remainder
      if ((remainder =  self.amount_cents%podcast_ids.length) != 0 )
        self.allocations.each do |a|
          a.amount_cents+=1 if remainder > 0
          remainder = remainder -1
          a.save
          
        end
      end
      reload
      self.podcast_ids = nil
    end
  end

  def self.human_attribute_name(column_name)
    case (column_name)
    when "amount_cents"
      "Amount"
    when "podcast_ids"
      "Podcasts"
    else
      super
    end
  end




end
