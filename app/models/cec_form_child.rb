class CecFormChild < ActiveRecord::Base
   belongs_to :cec_form
  
   validates :cesko_complaint_author_sender, :responder_district_election_commission, :cesko_complaint_registration_time, :presence => true
  
  
end
