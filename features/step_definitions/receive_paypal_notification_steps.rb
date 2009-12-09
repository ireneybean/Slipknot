When /^I receive a notification of payment received$/ do 
  post payments_url, :payment_gross=> 15.00, :mc_currency => "USD", :mc_gross=> 15.00, :mc_fee=> 0.75, :payment_fee=>0.75, :action => "paypal_ipn", :payment_date => Time.now, :item_number => @donation.id
end

Then /^I have a payment record for my donation$/ do
  response.status.should contain("200")
  Donation.find(@donation.id).payments.should_not be_nil
end

