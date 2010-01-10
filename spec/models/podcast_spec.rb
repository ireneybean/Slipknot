require 'spec_helper'

describe Podcast do
  fixtures :podcasts

  it "should have EscapePod, PodCastle, and Pseudopod preloaded" do
     podcasts = Podcast.find(:all)
     podcasts.length.should== 3
     podcasts.select {|podcast| podcast.name =~ /Escape Pod/ }.length.should==1
     podcasts.select {|podcast| podcast.name =~ /PodCastle/ }.length.should==1
     podcasts.select {|podcast| podcast.name =~ /Pseudopod/ }.length.should==1
  end

  it "should allow donations to be associated with itself" do
    p = Podcast.new
    d = Donation.new
    p.save
    p.donations.create
    p.donations.should_not be_nil
  end
  


  







end
