Fixtures.create_fixtures("spec/fixtures", "podcasts")
Then /^I should have a donation for "([^\"]*)"$/ do |name|
  @donation = Donation.find_by_name(name)
end

Then /^I should see a button labeled "([^\"]*)"$/ do |value|
  response.should have_tag('input',:type => 'submit', :value => value)
end

Given /^I have made a "([^\"]*)" donation record$/ do |type|
  if (type=="single")
    @donation = OneTimeDonation.create(:name => "Bob", :email => "BobSmith@gmail.com", :amount => 15, "podcast_ids"=>Podcast.find(:all,:select=>'id').map {|x| x.id})


  else
    @donation = RecurringDonation.create(:name => "Bob", :email => "BobSmith@gmail.com", :amount => 15, "podcast_ids"=>Podcast.find(:all,:select=>'id').map {|x| x.id})
  end
end

Then /^I should see the paypal form$/ do
  response.should have_tag('form', :action => "https://www.paypal.com/cgi-bin/webscr")
end

Then /^a hidden "([^\"]*)" should be "([^\"]*)"$/ do |field_name, value|
  response.should have_tag('input', :type=>'hidden', :name=>field_name, :value=> value )
end
Then /^a hidden "([^\"]*)" should be the donation (.*)$/ do |field_name, attribute|
  response.should have_tag('input', :type=>'hidden', :name=>field_name, :value=> @donation.send(attribute.to_sym) )
end

Then /^the checkbox with id "([^\"]*)" should be checked$/ do |id|
  field_with_id(id).should be_checked
end


Then /^the checkbox with id "([^\"]*)" should not be checked$/ do |id|
  field_with_id(id).should_not be_checked
end

When /^I check the checkbox with id "([^\"]*)"$/ do |field|
  check(field)
end
