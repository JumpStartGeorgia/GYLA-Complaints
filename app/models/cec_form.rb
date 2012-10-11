class CecForm < ActiveRecord::Base
   has_many :cec_form_children, :dependent => :destroy
   accepts_nested_attributes_for :cec_form_children, :reject_if => lambda { |a| (a[:cesko_complaint_author_sender].blank? && a[:responder_district_election_commission].blank? && a[:cesko_complaint_registration_time].blank? ) }, :allow_destroy => true

  attr_accessible :cesko_list_observer,
      :monitoring_time,
      :organization_name,
      :cec_form_children_attributes,
		:cesko_summary_report_input,
		:if_not_precinct_name_and_num,
		:cesko_election_summary_after_one_day,
		:if_not_after_one_day_precinct_name_num,
		:cesko_report_web_translition,
		:if_not_the_reason,
		:cesko_summary_process_transparently,
		:description_how_transparent

  scope :sorted, order('date(monitoring_time) DESC, id asc')

end
