require 'spec_helper'

describe Donation do
  fixtures :podcasts
  before(:each) do
    @valid_attributes = {
      :amount_cents => 50,
      :name => "value for name",
      :email => "value for email",
      :podcast_ids => Podcast.find(:all).map {|x| x.id}
    }
    @d = Donation.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    Donation.create!(@valid_attributes)
  end

  it "converts the amount to cents" do
    @d.amount = 15.35
    @d.amount_cents.should == 1535
  end

  it "converts the amount in cents to amount in dollars" do
    @d.amount_cents = 1535
    @d.amount.should == 15.35
  end
  
  it "returns a blank amount if there are no cents" do
    @d.amount_cents = nil
    @d.amount.should be_nil
  end
  
  it "converts the amount as a string to cents" do
    @d.amount = "15.35"
    @d.amount_cents.should == 1535
  end

  it "should not allow the donation amount to be less than 0" do
    @d.amount = -1
    @d.should_not be_valid
  end
  
  it "can be saved" do
    @d.save.should be_true
  end
  
  it "should allow payments to be associated with itself" do
    @d.save
    p = @d.payments.create
    @d.payments.should_not be_nil
  end
  
  it "should allow podcasts to be associated with itself" do 
    @d.save
    @d.podcasts.create
    @d.podcasts.should_not be_nil
  end
  
  it "should be associated with all podcasts by default" do
    dd = Donation.new
    dd.podcasts.length.should==Podcast.find(:all).length

  end
  it "should be associated with at least one podcast" do
    @d.podcast_ids=[]
    @d.should_not be_valid
  end
  it "should be associated with allocation information for each podcast that it is associated with" do
    @d.save
    @d.podcasts.each do |p|
      @d.allocations.select{|a| a.podcast_id == p.id}.size.should==1
    end
  end
  
  it "should contain allocation records whose amounts total its own amount" do
    @d.save
    sum ||= 0
    @d.allocations.each do |a|
      sum += a.amount_cents
    end 
    sum.should == 50
  end
  
  it "should allocate the remainder of any donation" do
    d = Donation.new(
      :amount_cents => 5,
      :name => "value for name",
      :email => "value for email",
      :podcast_ids => Podcast.find(:all).map {|x| x.id})
      d.save
      d.allocations.size.should == 3
      d.allocations[0].amount_cents.should == 2
      d.allocations[1].amount_cents.should == 2
      d.allocations[2].amount_cents.should == 1
  end
end
