require 'spec_helper'

describe RecurringDonation do
  fixtures :podcasts
  before(:each) do
    @valid_attributes = {
      :amount_cents => 1,
      :name => "value for name",
      :email => "value for email",
      :podcasts => Podcast.find(:all)
    }
    @d = RecurringDonation.new(@valid_attributes)
  end
  
  it "should be a child of donation" do
    RecurringDonation.create!(@valid_attributes).is_a? Donation
  end

  it "should be an instance of RecurringDonation" do
    RecurringDonation.create!(@valid_attributes).instance_of? RecurringDonation
  end

  it "should have a type of 'RecurringDonation' " do
    RecurringDonation.create!(@valid_attributes).type.should == "RecurringDonation"
  end  
  
  it "should create a new instance given valid attributes" do
    RecurringDonation.create!(@valid_attributes)
  end
end
