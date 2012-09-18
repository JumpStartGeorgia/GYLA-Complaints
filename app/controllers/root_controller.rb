class RootController < ApplicationController

  def index

    @latest_complaint = Complaint.last

    

  end


end
