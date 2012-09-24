class CecFormChild < ActiveRecord::Base
   belongs_to :cec_form
   attr_accessible :cec_form_children_attributes
end
