class PaymentsController < ApplicationController
  before_filter :find_donation
  protect_from_forgery :except => [:create]
  def new
  end

  def find_donation
    @donation = Donation.find(params[:donation_id] || params[:item_number])
  end
  
  def create
     if paypal_ack(params) && @donation.payments.create( params.reject {|key, value| !Payment.column_names.include? key})
       render :text=>"",:status => 200
     else 
       render :text=>"", :status => 500
     end
  end
  
  def paypal_ack (params)
    logger.info 'Received Paypal IPN Request.  Verifying'
    params.store("cmd", "notify-verify")
    resp= Net::HTTP.post_form( URI.parse("http://sandbox.paypal.com/"), params )  #TODO: URL in constant that depends on env
    logger.error "Paypal verification failed for #{params.inspect}\nFailure was: #{resp.inspect}" unless resp.body=="VERIFIED"
    return resp.body=="VERIFIED"
    
  end
end
