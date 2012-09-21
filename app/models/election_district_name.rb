class ElectionDistrictName < ActiveRecord::Base
  attr_accessible :title
  has_many :complaints
end
