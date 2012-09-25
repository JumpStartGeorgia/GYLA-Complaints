class CecForm < ActiveRecord::Base
   has_many :cec_form_children, :dependent => :destroy
   accepts_nested_attributes_for :cec_form_children, :allow_destroy => true

  attr_accessible :cec_form_children_attributes,
		:cesko_summary_report_input,
		:if_not_precinct_name_and_num,
		:cesko_election_summary_after_one_day,
		:if_not_after_one_day_precinct_name_num,
		:cesko_report_web_translition,
		:if_not_the_reason,
		:cesko_summary_process_transparently,
		:description_how_transparent

end
