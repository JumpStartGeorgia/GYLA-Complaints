class DecFormChild < ActiveRecord::Base
   belongs_to :dec_form
   
            validates :complaint_author_presentator, :response_precinct_commission, :complaint_district_registration_time, :presence => true
   
end
