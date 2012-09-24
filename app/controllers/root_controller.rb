class RootController < ApplicationController
  before_filter :authenticate_user!

  def index
		if user_signed_in?
    	@latest_complaint = Complaint.last
		end
  end


end
