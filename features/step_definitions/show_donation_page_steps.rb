
Then /^I should have a donation for "([^\"]*)"$/ do |name|
  @donation = Donation.find_by_name(name)
end

Then /^I should see a button labeled "([^\"]*)"$/ do |value|
  response.should have_tag('input',:type => 'submit', :value => value)
end

Given /^I have made a donation record$/ do
  @donation = Donation.create(:name => "Bob", :email => "BobSmith@gmail.com", :amount => 15, :escape_pod => true, :recurring => false)
end

Then /^I should be redirected to Paypal$/ do
  response.should contain("This is paypal")
end

