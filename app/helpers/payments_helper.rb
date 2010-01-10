
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
  
  def display_podcasts
    podcast_html = ""
    @donation.podcasts.each { |podcast|
      podcast_html += podcast.name + "<br>"
    }
    podcast_html
  end
end
