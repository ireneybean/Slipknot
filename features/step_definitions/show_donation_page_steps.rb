
Then /^I should have a donation for "([^\"]*)"$/ do |name|
  @donation = Donation.find_by_name(name)
end

Then /^I should see a button labeled "([^\"]*)"$/ do |value|
  response.should have_tag('input',:type => 'submit', :value => value)
end

Given /^I have made a donation record$/ do
  @donation = Donation.create(:name => "Bob", :email => "BobSmith@gmail.com", :amount => 15, :escape_pod => true, :recurring => false)
end

Then /^I should see the paypal form$/ do
  response.should have_tag('form', :action => "https://www.paypal.com/cgi-bin/webscr")
end


Then /^a hidden "([^\"]*)" should be the donation (.*)$/ do |field_name, attribute|
  response.should have_tag('input', :type=>'hidden', :name=>field_name, :value=> @donation.send(attribute.to_sym) )
end


