class PaymentsController < ApplicationController
  before_filter :find_donation
  def new
  end

  def find_donation
    @donation = Donation.find(params[:donation_id])
  end
end