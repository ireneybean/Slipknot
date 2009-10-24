require 'spec_helper'

describe Donation do
  before(:each) do
    @valid_attributes = {
      :amount_cents => 1,
      :name => "value for name",
      :email => "value for email",
      :escape_pod => false,
      :pseudopod => false,
      :podcastle => false,
      :recurring => false
    }
  end

  it "should create a new instance given valid attributes" do
    Donation.create!(@valid_attributes)
  end

  it "converts the amount to cents" do
    d = Donation.new
    d.amount = 15.35
    d.amount_cents.should == 1535
  end

  it "converts the amount in cents to amount in dollars" do
    d = Donation.new
    d.amount_cents = 1535
    d.amount.should == 15.35
  end
  
  it "converts the amount as a string to cents" do
    d = Donation.new
    d.amount = "15.35"
    d.amount_cents.should == 1535
  end  
end
