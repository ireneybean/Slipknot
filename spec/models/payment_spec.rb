require 'spec_helper'

describe Payment do
  before(:each) do
      @valid_attributes = {
      
      }
    end
    
    
  it "should belong to a donation" do
    Payment.new(:donation => nil).should_not be_valid
  end
  
  
  end
