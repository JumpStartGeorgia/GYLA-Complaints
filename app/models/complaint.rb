class Complaint < ActiveRecord::Base
  has_many :complaint_files, :dependent => :destroy
  accepts_nested_attributes_for :complaint_files, :reject_if => lambda { |a| a[:file].blank? }, :allow_destroy => true
  attr_accessible :complaint_files_attributes, 
                  :observer_name, 
                  :observer_address, 
                  :observer_phone, 
                  :election_district_name, 
                  :election_precinct_number, 
                  :category, 
                  :violation_type, 
                  :violation_time, 
                  :witness, 
                  :violator_info, 
                  :other_info, 
                  :status, 
                  :complaint_author_name, 
                  :complaint_author_phone, 
                  :court_name, 
                  :complaint_writing_time, 
                  :request_in_complaint, 
                  :response_date, 
                  :complaint_result, 
                  :additional_comment, 
                  :level




end
