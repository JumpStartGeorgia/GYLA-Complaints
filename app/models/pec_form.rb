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


end
