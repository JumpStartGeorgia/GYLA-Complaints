class ComplaintFile < ActiveRecord::Base
	has_attached_file :file,
    :url => "/system/complaint_files/:attachment/:complaint_id/:style/:filename",
    :path => ":rails_root/public/system/complaint_files/:attachment/:complaint_id/:style/:filename"

	validates_attachment_size :file, :less_than => 10.megabytes

	belongs_to :complaint
  attr_accessible :file,
    :complaint_id,
    :file_file_name,
    :file_content_type,
    :file_file_size,
    :file_updated_at,
    :created_at,
    :updated_at,
    :attachment_type,
    :additional_info_id

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
