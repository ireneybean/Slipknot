require 'spec_helper'

describe PaymentsHelper do
  fixtures :podcasts

  it "is monthly when the donation is recurring" do
    donation = RecurringDonation.new
    assigns[:donation] = donation
    helper.donation_type.should =~ /monthly/
  end
  
  it "is right now when the donation is not recurring" do
    donation = OneTimeDonation.new
    assigns[:donation] = donation
    helper.donation_type.should =~ /right now/
  end
  
  it "is Anonymous when there's no name" do
    donation = OneTimeDonation.new(:name => "")
    assigns[:donation] = donation #What is this?
    helper.display_name.should =~ /Anonymous/
  end
  
  it "is undisclosed when there's no email" do
    donation = OneTimeDonation.new(:email => "")
    assigns[:donation] = donation
    helper.display_email.should =~ /undisclosed/
  end
  
  it "is contains each of the supported podcasts" do
    supported = Podcast.find(:all)
    donation = OneTimeDonation.new
    donation.podcasts = supported
    assigns[:donation] = donation

    helper.display_podcasts.should =~ /Escape Pod/ 
    helper.display_podcasts.should =~ /PodCastle/
    helper.display_podcasts.should =~ /Pseudopod/
  end
   
  it "does not contain unsupported podcasts" do
    donation = OneTimeDonation.new
    supported = Podcast.find(:all)
    donation.podcasts = supported[0..1]
    
    assigns[:donation] = donation
    helper.display_podcasts.match(supported[0].name).should_not be_nil
    helper.display_podcasts.match(supported[1].name).should_not be_nil
    helper.display_podcasts.match(supported[2].name).should be_nil
  end
  
end
