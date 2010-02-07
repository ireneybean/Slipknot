require 'spec_helper'

describe OneTimeDonation do
  fixtures :podcasts
  before(:each) do
    @valid_attributes = {
      :amount_cents => 1,
      :name => "value for name",
      :email => "value for email",
      :podcast_ids => Podcast.find(:all).map {|x| x.id}
    }
    @d = OneTimeDonation.new(@valid_attributes)
  end

  it "should be a child of donation" do
    OneTimeDonation.create!(@valid_attributes).is_a? Donation
  end

  it "should be an instance of OneTimeDonation" do
    OneTimeDonation.create!(@valid_attributes).instance_of? OneTimeDonation
  end

  it "should have a type of 'OneTimeDonation'" do
    OneTimeDonation.create!(@valid_attributes).type.should == "OneTimeDonation"
  end

  it "should create a new instance given valid attributes" do
    OneTimeDonation.create!(@valid_attributes)
  end

end
