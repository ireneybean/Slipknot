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
    @donation = Donation.new(params[:donation])
    if @donation.save
      redirect_to new_donation_payment_path(@donation)
    end
  end
  
  # Show the form to alter exiting record
  def edit
  end
  
  # PUT action to edit the record
  def update
  end
  
  # Delete the record
  def destroy
  end
  
end
