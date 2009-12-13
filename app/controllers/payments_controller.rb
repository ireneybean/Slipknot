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
    #TODO: add notify_verify
    #TODO do not save if this is a dup (validation in model)
    params.store("cmd", "notify-verify")
    resp= Net::HTTP.post_form( URI.parse("http://sandbox.paypal.com/"), params )  #TODO: URL in constant that depends on env
    resp.body=="VERIFIED"
  end
end
