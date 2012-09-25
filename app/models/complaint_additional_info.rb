class ComplaintAdditionalInfo < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :status

  attr_accessible :complaint_id,
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
