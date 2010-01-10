require 'acts_as_currency'
class Donation < ActiveRecord::Base
  extend ActsAsCurrency
  acts_as_currency :amount
  has_many :payments
  has_many :allocations
  has_many :podcasts, :through => :allocations
  validates_numericality_of :amount_cents, :greater_than=>0
  validates_presence_of :podcasts
  after_save :update_podcasts

  attr_accessor :podcast_ids
  
  def initialize(*args)
    super
    self.podcasts = Podcast.find(:all)
    
  end

  #after_save callback to handle podcast_ids
  def update_podcasts
    unless podcast_ids.nil?
      self.allocations.each do |a|
        a.destroy unless podcast_ids.include?(a.podcast_id.to_s)
        podcast_ids.delete(a.podcast_id.to_s)
      end 
      podcast_ids.each do |p|
        self.allocations.create(:podcast_id => p, :amount_cents=> self.amount_cents/podcast_ids.length) unless p.blank?
      end
      reload
      self.podcast_ids = nil
    end
  end

  def self.human_attribute_name(column_name)
    if (column_name == "amount_cents")
      "Amount"
    else
      super
    end
  end




end
