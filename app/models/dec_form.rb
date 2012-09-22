class DecForm < ActiveRecord::Base
   has_many :dec_form_children, :dependent => :destroy
   accepts_nested_attributes_for :dec_form_children, :allow_destroy => true
   attr_accessible :dec_form_children_attributes
end
