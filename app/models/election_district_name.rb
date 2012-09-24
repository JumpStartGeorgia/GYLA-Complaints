class ElectionDistrictName < ActiveRecord::Base
  attr_accessible :title
  has_many :complaint_general_infos
end
