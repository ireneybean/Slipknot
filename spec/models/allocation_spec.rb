require 'spec_helper'

describe Allocation do

  before(:each) do
    @a = Allocation.new
  end
  it "should be associated with one donation and one podcast" do
    pending
  end
  
  it "converts the amount to cents" do
    @a.amount = 15.35
    @a.amount_cents.should == 1535
  end

  it "converts the amount in cents to amount in dollars" do
    @a.amount_cents = 1535
    @a.amount.should == 15.35
  end
  
  it "returns a blank amount if there are no cents" do
    @a.amount_cents = nil
    @a.amount.should be_nil
  end
  
  it "converts the amount as a string to cents" do
    @a.amount = "15.35"
    @a.amount_cents.should == 1535
  end

  it "should not allow the amount to be less than 0" do
    pending  
    @a.amount = -1
    @a.should_not be_valid
  end
  


end
