class PaymentsController < ApplicationController
  before_filter :find_donation
  def new
  end

  def find_donation
    @donation = Donation.find(params[:donation_id] || params[:item_number])
  end
  
  def create
     if @donation.payments.create( params.reject {|key, value| key=="controller"})
       render :text=>"",:status => 200
     else 
       render :text=>"", :status => 500
     end
  end
end
