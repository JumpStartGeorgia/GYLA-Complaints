#encoding: utf-8
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
			:description,
			:election_district_name,
			:election_precinct_number,
			:category_id,
			:violation_type_id,
			:violation_time,
			:witness,
			:violator_info,
			:other_info,
			:status_old,
			:created_at,
			:updated_at,
			:election

  validates :observer_address,
			# level,
			:observer_name,
			:observer_phone,
			:election_district_name,
			:election_precinct_number,
			:category_id,
			:description,
			:violation_type_id,
			:violation_time, :presence => true

	validates	:election_district_name, :election_precinct_number,	:category_id,
			:violation_type_id, :numericality => { :only_integer => true }

	validates_associated :complaint_additional_infos

  scope :sorted, order('date(violation_time) DESC, level asc, election_district_name asc, election_precinct_number asc')

	before_create :set_values
	before_save :update_level
	before_save :set_election_name

	def set_values
		self.original_level = self.level
	end

	# make the complaint level = to the latest level
	def update_level
		if additional && !additional.empty? && !additional.last.level.empty?
			self.level = additional.last.level
		end
	end

	def set_election_name
		self.election = ELECTIONS[ELECTIONS.length - 1][1] if (self.attributes.has_key? 'election')
	end

  def additional
    self.complaint_additional_infos
  end

	# get the latest date associated with the complaint record
	def latest_writing_date
		(self.additional.latest && self.additional.latest.complaint_writing_time) ?
				self.additional.latest.complaint_writing_time : nil
	end

   def district_name
		district = DistrictIdName.where("district_id = ?", self.election_district_name)
		if district && !district.empty?
			return "#{district[0].district_id} - #{district[0].district_name}"
		else
			return nil
		end
   end

	def level_name
	  l = ''
		if self.level.to_s.length > 0
		  l = self.level
		elsif self.additional.latest
		  l = self.additional.latest.level
		end

		index = LEVELS.map{|x| x[1]}.index(l)
		if index
			return LEVELS[index][0]
		end

		''
	end

  # add a new election at the end
  ELECTIONS = [['2012 წლის საპარლამენტო არჩევნები', '2012_parl'],['2010 წლის ადგილობრივი თვითმმართველობის არჩევნები', '2010_local']]

	def election_name
	  if self.election
		  index = ELECTIONS.map{|x| x[1]}.index(self.election)
		  if index
			  return ELECTIONS[index][0]
		  end
	  end
		''
	end

	def is_court?
		if self.level
			if !(COURTS.map{|x| x[1]}.index(self.level)).nil?
				return true
			end
		end
		return false
	end

	def is_last_level?
		if self.level
			if LEVELS.last[1] == self.level
				return true
			end
		end
		return false
	end

	COURTS = [['საქალაქო სასამართლო', 'court'], ['სააპელაციო სასამართლო', 'appeal']]
	LEVELS = [['PEC', 'pec'], ['DEC', 'dec'], ['CEC', 'cec'], ['საქალაქო სასამართლო', 'court'], ['სააპელაციო სასამართლო', 'appeal']]
	# get all of the levels that are higher than the current one
	def available_levels

    l = LEVELS.map{|x| x[1]}
		if self.additional && self.additional.latest
	    return LEVELS[(l.index(self.additional.latest.level.downcase) + 1)..-1]
		else
			return LEVELS
		end
	end

  def is_old?
    (self.attributes.has_key? 'status_old') && !self.status_old.nil?
  end

end
