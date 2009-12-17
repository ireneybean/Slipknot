class PaymentsController < ApplicationController
  before_filter :find_donation
  protect_from_forgery :except => [:create]
  def new
  end

  PAYPAL_URI = "http://www.sandbox.paypal.com/cgi-bin/webscr"
  
  def find_donation
    @donation = Donation.find(params[:donation_id] || params[:item_number])
  end
  
  def create
     if paypal_ack(request.raw_post) && @donation.payments.create( params.reject {|key, value| !Payment.column_names.include? key})
       render :text=>"",:status => 200
     else 
       render :text=>"", :status => 500
     end
  end
 
  def paypal_ack (ipn_raw)
    logger.info 'Received Paypal IPN Request.  Verifying'
    status = nil
    uri = URI.parse(PAYPAL_URI )
    Net::HTTP.start(uri.host, uri.port) do |request|
      status = request.post(uri.path, ipn_raw + "&cmd=_notify-validate" ).body
    end
    
    logger.error "Paypal verification failed.\nResponse body was: #{status}" unless status=="VERIFIED"
    status=="VERIFIED"
   end
end


 
