require 'spec_helper'
require 'fakeweb'

describe PaymentsController do
  PAYPAL_URI = 'http://sandbox.paypal.com'
  before(:each) do
      @controller = PaymentsController.new
  end
  
  def reg_fakeweb(url, resp)
    FakeWeb.register_uri(:post, url, :body=> resp)	 
  end

  def do_ack
    @controller.paypal_ack( {'q'=>'ruby', 'max'=>'50'}) 
  end

  it "sends a notify-validate request and its input to PayPal" do
    #TODO: Not done
    reg_fakeweb(PAYPAL_URI, "VERIFIED")
    do_ack
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
end  
