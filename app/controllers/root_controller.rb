class RootController < ApplicationController
  before_filter :authenticate_user!

  def index
    @latest_complaint = Complaint.last if user_signed_in?
  end


end
