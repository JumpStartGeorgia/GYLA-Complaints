class PecForm < ActiveRecord::Base
  attr_accessible :election_district_number,
		:election_precinct_number,
		:observer_name,
		:current_number_of_complaints,
		:complaint_author,
		:registration_time,
		:do_you_give_complaint_to_higher_commission,
		:violation_essence,
		:request,
		:was_complaint_setisfied,
		:other_extra_comments
   
   def district_name
      district = DistrictIdName.where("district_id = ?", self.election_district_number)
      if district.length > 0
         return district[0].district_name
      else
         return 0
      end
   end   

end