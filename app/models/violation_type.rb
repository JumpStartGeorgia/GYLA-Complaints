class ViolationType < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :title
  has_many :complaints

end
