Given /^the following show_donation_pages:$/ do |show_donation_pages|
  ShowDonationPage.create!(show_donation_pages.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) show_donation_page$/ do |pos|
  visit show_donation_pages_url
  within("table > tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following show_donation_pages:$/ do |expected_show_donation_pages_table|
  expected_show_donation_pages_table.diff!(table_at('table').to_a)
end
