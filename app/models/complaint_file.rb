class ComplaintFile < ActiveRecord::Base
	has_attached_file :file,
    :url => "/system/complaint_files/:attachment/:complaint_id/:style/:filename",
    :path => ":rails_root/public/system/complaint_files/:attachment/:complaint_id/:style/:filename"

	belongs_to :complaint
  attr_accessible :complaint_id, :file, :attachment_type

  def self.observers
    where(:attachment_type => 'observer')
  end

  def self.others
    where(:attachment_type => 'other')
  end
end
