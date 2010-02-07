class DonationsController < ApplicationController
  # Show all records
  def index
  end
  
  # Show one record
  def show
  end
  
  # Show the form to make a new record
  def new
    @donation = Donation.new
  end
  
  # POST action to create the record
  def create
    #if no podcast was selected, choose all three
    params[:donation][:podcast_ids] ||=[]# Podcast.find(:all,:select=>'id').map {|x| x.id}
    if (params[:donation][:type]=="RecurringDonation")
      @donation = RecurringDonation.new(params[:donation])
    else
      @donation = OneTimeDonation.new(params[:donation])
    end
    puts params[:donation][:podcast_ids]
    puts @donation.podcast_ids.length
    if @donation.save
      redirect_to new_donation_payment_path(@donation)
    else
      render :new
    end
  end
  
  # Show the form to alter existing record
  def edit
    @donation = Donation.find(params[:id])
  end
  
  # PUT action to edit the record
  def update
    @donation = Donation.find(params[:id])
    #if no podcast was selected, choose all three.
    params[:donation][:podcast_ids] ||= []#Podcast.find(:all,:select=>'id').map {|x| x.id} 
    unless params[:donation][:type] == @donation.class
      @donation.type = params[:donation][:type]
      @donation.save!
      @donation= Donation.find(params[:id])
    end
    if @donation.update_attributes(params[:donation])
      redirect_to new_donation_payment_path(@donation)
    else
      render :edit
    end  
  end
  
  # Delete the record
  def destroy
    logger.warn "in destroy"
    Donation.destroy(params[:id])
    redirect_to new_donation_path
  end
  
end
