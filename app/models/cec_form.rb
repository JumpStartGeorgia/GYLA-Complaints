class CecForm < ActiveRecord::Base
   has_many :cec_form_children, :dependent => :destroy
   accepts_nested_attributes_for :cec_form_children, :allow_destroy => true   
end
