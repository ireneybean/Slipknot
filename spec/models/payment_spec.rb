require 'spec_helper'

describe Payment do
  before(:each) do
      @valid_attributes = {
      }
      @p = Payment.new(@valid_attributes)
    end
    
    
  it "should belong to a donation" do
    Payment.new(:donation => nil).should_not be_valid
  end
  #TODO
  it "should have a unique txn_id" do
    donation = Donation.create
    Payment.create(:donation=>donation, :txn_id => "1").should be_valid
    Payment.new(:donation=>donation,:txn_id => "1").should_not be_valid
  end

 it "converts the gross_amount to cents" do
    @p.payment_gross = 15.35
    @p.payment_gross_cents.should == 1535
  end

  it "converts the gross_amount in cents to gross_amount in dollars" do
    @p.payment_gross_cents = 1535
    @p.payment_gross.should == 15.35
  end
  
  it "returns a blank amount if there are no cents" do
    @p.payment_gross_cents = nil
    @p.payment_gross.should be_nil
  end
  
 it "converts the fees to cents" do
    @p.payment_fee = 15.35
    @p.payment_fee_cents.should == 1535
  end

  it "converts the fees in cents to amount in dollars" do
    @p.payment_fee_cents = 1535
    @p.payment_fee.should == 15.35
  end
  
  it "returns a blank amount if there are no fees" do
    @p.payment_fee_cents = nil
    @p.payment_fee.should be_nil
  end
  
  
  end
