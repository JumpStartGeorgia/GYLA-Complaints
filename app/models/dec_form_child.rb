class DecFormChild < ActiveRecord::Base
   belongs_to :dec_form
   attr_accessible :dec_form_children_attributes
end
