require 'spec_helper'
require 'fakeweb'

describe PaymentsController do


  before(:each) do
      @controller = PaymentsController.new
  end
  
  def reg_fakeweb(url, resp)
    FakeWeb.register_uri(:post, url, :body=> resp)	 
  end

  def do_ack
    @controller.paypal_ack( '&ruby=50') 
  end

  it "sends a notify-validate request and its input to PayPal" do
    pending
    #reg_fakeweb(PAYPAL_URI, "VERIFIED")
    #do_ack
  end 

  it "is true if PayPal tells us we're VERIFIED" do
    reg_fakeweb(PAYPAL_URI, "VERIFIED")
    do_ack.should be_true
  end

  it "is false if PayPal does not give us VERIFED" do
    reg_fakeweb(PAYPAL_URI, "INVALID")  
    do_ack.should be_false
  end
  
    it "logs a message if PayPal does not give us VERIFIED" do
#    reg_fakeweb(PAYPAL_URI, "INVALID")   
   # FakeWeb.register_uri(:post, "https://sandbox.paypal.com/cgi-bin/webscr/", :body => "INVALID")
   # do_ack
    pending
  end
  
  it "creates a payment record" do
    pending
    @donation = OneTimeDonation.new(:amount_cents => 1, :podcasts => Podcast.find(:all))
    @donation.save==true
    reg_fakeweb(PAYPAL_URI, "VERIFIED")
    post payments_url, "payment_status"=>"Completed", "payer_email"=>"buyer@paypalsandbox.com", "address_name"=>"John Smith", "address_country"=>"United States", "address_city"=>"San Jose", "business"=>"seller@paypalsandbox.com", "receiver_id"=>"TESTSELLERID1", "residence_country"=>"US", "tax"=>"2.02", "receiver_email"=>"seller@paypalsandbox.com", "mc_gross_1"=>"9.34", "address_street"=>"123, any street", "verify_sign"=>"AFcWxV21C7fd0v3bYYYRCpSSRl31ALknSCqka21G2Clfy5lWGCgwk5S2", "address_zip"=>"95131", "quantity"=>"1", "mc_currency"=>"USD", "txn_type"=>"web_accept", "address_country_code"=>"US", "item_name"=>"something", "txn_id"=>"5121266", "charset"=>"windows-1252", "payer_status"=>"verified", "address_state"=>"CA", "notify_version"=>"2.1", "payment_date"=>"22:06:05 Dec. 11, 2009 PST", "address_status"=>"confirmed", "shipping"=>"3.04", "mc_fee"=>"0.44", "test_ipn"=>"1", "payment_type"=>"instant", "first_name"=>"John", "last_name"=>"Smith", "payer_id"=>"TESTBUYERID01", "mc_gross"=>"12.34", "item_number"=>@donation.id, "custom"=>"xyz123"
    d.payments.should_not be_nil
    d.payments[0].payment_status.should == "Completed"
    
  end
end  
