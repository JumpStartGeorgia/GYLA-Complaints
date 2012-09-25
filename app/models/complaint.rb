class Complaint < ActiveRecord::Base
  has_many :complaint_files, :dependent => :destroy
  has_many :complaint_additional_infos, :dependent => :destroy

  belongs_to :category
  belongs_to :violation_type

  accepts_nested_attributes_for :complaint_files, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :complaint_additional_infos,
			:reject_if => lambda { |a| (a[:level].blank? && a[:status_id].blank?) }, :allow_destroy => true

  attr_accessible :complaint_files_attributes, :complaint_additional_infos_attributes,
			:level,
			:original_level,
			:observer_name,
			:observer_address,
			:observer_phone,
			:election_district_name,
			:election_precinct_number,
			:category_id,
			:violation_type_id,
			:violation_time,
			:witness,
			:violator_info,
			:other_info

	before_create :set_values

	def set_values
		self.original_level = self.level
	end

  def additional
    self.complaint_additional_infos
  end

	LEVELS = [['PEC', 'pec'], ['DEC', 'dec'], ['CEC', 'cec'], ['Court', 'court']]
	# get all of the levels that are not in use
	def available_levels
		in_use = self.complaint_additional_infos.collect(&:level)
logger.debug "in use = #{in_use}"
		if in_use && !in_use.empty?
logger.debug " - records are in use, checking for avilable"

			available_levels = []
			LEVELS.each do |level|
				if in_use.index(level[1]).nil?
					available_levels << level
				end
			end
logger.debug " - available levels = #{available_levels}"
			# add empty record at front
			return available_levels.insert(0,[]) if !available_levels.empty?
		else
logger.debug " - all levels available"
			# all levels are available
			return LEVELS
		end
	end

end
