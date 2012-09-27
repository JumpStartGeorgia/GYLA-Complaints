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

  validates :level,
			:observer_name,
			:observer_address,
			:observer_phone,
			:election_district_name,
			:election_precinct_number,
			:category_id,
			:violation_type_id,
			:violation_time, :presence => true

	validates	:election_district_name, :election_precinct_number,	:category_id,
			:violation_type_id, :numericality => { :only_integer => true }

	validates_associated :complaint_additional_infos

	before_create :set_values

	def set_values
		self.original_level = self.level
	end

  def additional
    self.complaint_additional_infos
  end

   def district_name
		district = DistrictIdName.where("district_id = ?", self.election_district_name)
		if district && !district.empty?
			return "#{district[0].district_id} - #{district[0].district_name}"
		else
			return nil
		end
   end


	LEVELS = [['PEC', 'pec'], ['DEC', 'dec'], ['CEC', 'cec'], ['Court', 'court']]
	# get all of the levels that are higher than the current one
	def available_levels

    l = ['pec', 'dec', 'cec', 'court']
		if self.additional && self.additional.latest
	    return LEVELS[(l.index(self.additional.latest.level.downcase) + 1)..3]
		else
			return LEVELS
		end
	end

end
