class DecForm < ActiveRecord::Base
   has_many :dec_form_children, :dependent => :destroy
   accepts_nested_attributes_for :dec_form_children, :allow_destroy => true

  attr_accessible :dec_form_children_attributes,
		:dec_total_complaints,
		:dec_journal_registration_yes_no,
		:ped_entered_with_law,
		:lonked_election_lists,
		:complaints,
		:get_send_act,
		:describe_extra_env,
		:was_canonical_procedures_done,
		:where_props_filled,
		:precinct_results_canel_proc,
		:commission_summary_report_publicity,
		:extra_env_describe,
		:summed_up_or_not_summary_reports

end
