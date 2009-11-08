require 'spec_helper'

describe PaymentsHelper do

  it "is monthly when the donation is recurring" do
    donation = Donation.new(:recurring=>true)
    assigns[:donation] = donation
    helper.donation_type.should =~ /monthly/
  end
  
  it "is right now when the donation is not recurring" do
    donation = Donation.new(:recurring=>false)
    assigns[:donation] = donation
    helper.donation_type.should =~ /right now/
  end
  
  it "is Anonymous when there's no name" do
    donation = Donation.new(:name => "")
    assigns[:donation] = donation #What is this?
    helper.display_name.should =~ /Anonymous/
  end
  
  it "is undisclosed when there's no email" do
    donation = Donation.new(:email => "")
    assigns[:donation] = donation
    helper.display_email.should =~ /undisclosed/
  end
  
end
