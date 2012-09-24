class ComplaintGeneralInfo < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :category
  belongs_to :election_district_name
  belongs_to :election_precinct_number
  belongs_to :violation_type
  belongs_to :election_district_name

end
