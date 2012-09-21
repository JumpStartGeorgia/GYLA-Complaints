class Complaint < ActiveRecord::Base
  has_many :complaint_files, :dependent => :destroy
  belongs_to :category
  belongs_to :election_district_name
  belongs_to :election_precinct_number
  belongs_to :violation_type
  belongs_to :election_district_name
  belongs_to :status

  accepts_nested_attributes_for :complaint_files, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true
  attr_accessible :complaint_files_attributes, 
                  :observer_name, :observer_address, :observer_phone, 
                  :election_district_name_id, :election_precinct_number_id, 
                  :category_id, :status_id, 
                  :violation_type_id, :violation_time, 
                  :witness, 
                  :violator_info, :other_info, 
                  :complaint_author_name, :complaint_author_phone, 
                  :court_name, 
                  :complaint_writing_time, :request_in_complaint, 
                  :response_date, :complaint_result, 
                  :additional_comment, 
                  :level




end
