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
  
  def display_name
    @donation.name.empty? ? "Anonymous" : @donation.name
  end
  
  def display_email
    @donation.email.empty? ? "undisclosed" : @donation.email
  end
end
