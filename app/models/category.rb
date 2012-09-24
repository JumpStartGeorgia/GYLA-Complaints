class Category < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :title
  has_many :complaint_general_infos

end
