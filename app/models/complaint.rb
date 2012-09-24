class Complaint < ActiveRecord::Base
  has_many :complaint_files, :dependent => :destroy
  has_many :complaint_additional_infos, :dependent => :destroy
  has_one  :complaint_general_info, :dependent => :destroy

  accepts_nested_attributes_for :complaint_files, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true
  attr_accessible :complaint_files_attributes, :level, :original_level




end
