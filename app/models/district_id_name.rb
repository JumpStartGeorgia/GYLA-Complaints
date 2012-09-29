class DistrictIdName < ActiveRecord::Base   
  default_scope order("district_id")
end
