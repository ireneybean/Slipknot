
module PaymentsHelper

  def donation_type
    (@donation.instance_of? RecurringDonation) ? "monthly" : "right now"
  end
  
  def paypal_options
    if @donation.instance_of? RecurringDonation
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
  
  #TODO: This will change when Podcast Model is added
  def display_podcasts
    podcasts = @donation.escape_pod ? "Escape Pod <br>" : "";
    podcasts += @donation.podcastle ? "PodCastle <br>": "";
    podcasts += @donation.pseudopod ? "Pseudopod <br>" : "";
  end
end
