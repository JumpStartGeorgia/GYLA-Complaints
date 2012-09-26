class ComplaintFile < ActiveRecord::Base
	has_attached_file :file,
    :url => "/system/complaint_files/:attachment/:complaint_id/:style/:filename",
    :path => ":rails_root/public/system/complaint_files/:attachment/:complaint_id/:style/:filename"

	belongs_to :complaint
  attr_accessible :complaint_id, :file, :attachment_type, :additional_info_id

  def self.general
    where(:attachment_type => 'general')
  end

  def self.additional
    where('`attachment_type` != ?', 'general')
  end

  def self.not_existing
    where(:additional_info_id => 'not_existing')
  end

  def self.files_for(id)
    where(:additional_info_id => id)
  end
end
