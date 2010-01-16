When /^I receive a notification of payment received$/ do 
  #post payments_url, :payment_status=>"Completed", :txn_type=>"web_accept", :txn_id=>"5121266", :payment_type=>"instant",:payment_gross=> 15.00, :mc_currency => "USD", :mc_gross=> 15.00, :mc_fee=> 0.75, :payment_fee=>0.75, :payment_date => Time.now, :item_number => @donation.id
  post payments_url, "payment_status"=>"Completed", "payer_email"=>"buyer@paypalsandbox.com", "address_name"=>"John Smith", "address_country"=>"United States", "address_city"=>"San Jose", "business"=>"seller@paypalsandbox.com", "receiver_id"=>"TESTSELLERID1", "residence_country"=>"US", "tax"=>"2.02", "receiver_email"=>"seller@paypalsandbox.com", "mc_gross_1"=>"9.34", "address_street"=>"123, any street", "verify_sign"=>"AFcWxV21C7fd0v3bYYYRCpSSRl31ALknSCqka21G2Clfy5lWGCgwk5S2", "address_zip"=>"95131", "quantity"=>"1", "mc_currency"=>"USD", "txn_type"=>"web_accept", "address_country_code"=>"US", "item_name"=>"something", "txn_id"=>"5121266", "charset"=>"windows-1252", "payer_status"=>"verified", "address_state"=>"CA", "notify_version"=>"2.1", "payment_date"=>"22:06:05 Dec. 11, 2009 PST", "address_status"=>"confirmed", "shipping"=>"3.04", "mc_fee"=>"0.44", "test_ipn"=>"1", "payment_type"=>"instant", "first_name"=>"John", "last_name"=>"Smith", "payer_id"=>"TESTBUYERID01", "mc_gross"=>"12.34", "item_number"=>@donation.id, "custom"=>"xyz123"
end

##TODO: Not working because it is actually checking against paypal and failing.  However, now the rspec tests are testing this
##TODO: make sure that they test for a payment
#Then /^I have a payment record for my donation$/ do
#  response.status.should contain("200")
#  d=Donation.find(@donation.id)
#  d.payments.should_not be_nil
#  d.payments[0].payment_status.should == "Completed"
#end


