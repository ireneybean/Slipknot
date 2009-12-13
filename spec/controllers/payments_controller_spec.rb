require 'spec_helper'
require 'fakeweb'

describe PaymentsController do
  before(:each) do
      @controller = PaymentsController.new
      
  end
  
  def do_ack
    @controller.paypal_ack( {'q'=>'ruby', 'max'=>'50'}) 
  end
  it "sends a notify-validate request and its input to PayPal" do
    do_ack 
  end

  it "is true if PayPal tells us we're VERIFIED" do
    FakeWeb.register_uri(:post, "http://sandbox.paypal.com/", :body => "VERIFIED")  
    do_ack.should be_true
  end

  it "is false if PayPal does not give us VERIFED" do
    FakeWeb.register_uri(:post, "http://sandbox.paypal.com", :body => "INVALID")
    do_ack.should be_false
  end
  
  it "logs a message if PayPal does not give us VERIFIED" do
   # FakeWeb.register_uri(:post, "http://sandbox.paypal.com", :body => "INVALID")
   # do_ack
    pending
  end
end  
