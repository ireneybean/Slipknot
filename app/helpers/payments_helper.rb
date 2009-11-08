module PaymentsHelper
  def donation_type
    @donation.recurring ? "monthly" : "right now"
  end
  
  def paypal_options
    if @donation.recurring
      render :partial => "recurring"
    else
      render :partial => "onetime"
    end
  end
end
