
Then /^I should have a donation for "([^\"]*)"$/ do |name|
  @donation = Donation.find_by_name(name)
end

Then /^I should see a button labeled "([^\"]*)"$/ do |value|
  response.should have_tag('input',:type => 'submit', :value => value)
end

