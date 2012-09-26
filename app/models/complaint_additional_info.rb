class ComplaintAdditionalInfo < ActiveRecord::Base

  has_many :complaint_additional_files, :dependent => :destroy
  accepts_nested_attributes_for :complaint_additional_files, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true

  belongs_to :complaint
  belongs_to :status

  attr_accessible :complaint_additional_files_attributes, :complaint_id,
			:level,
			:status_id,
			:complaint_author_name,
			:complaint_author_phone,
			:court_name,
			:complaint_writing_time,
			:request_in_complaint,
			:response_date,
			:complaint_result,
			:additional_comment

  def self.latest
    order('created_at DESC, updated_at DESC').limit(1).first
  end

end
