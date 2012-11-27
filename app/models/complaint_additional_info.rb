class ComplaintAdditionalInfo < ActiveRecord::Base

 # has_many :complaint_additional_files, :dependent => :destroy
 # accepts_nested_attributes_for :complaint_additional_files, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true

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
			:additional_comment,
			:created_at, :updated_at

  validates :level, :status_id, :presence => true

	def level_name
		if self.level
			index = Complaint::LEVELS.map{|x| x[1]}.index(self.level)
			if index
				return Complaint::LEVELS[index][0]
			end
		end
	end

	def is_court?
		if self.level
			if !(Complaint::COURTS.map{|x| x[1]}.index(self.level)).nil?
				return true
			end
		end
		return false
	end

	def is_last_level?
		if self.level
			if Complaint::LEVELS.last[1] == self.level
				return true
			end
		end
		return false
	end


  def self.latest
    order('created_at DESC, updated_at DESC').limit(1).first
  end


end
