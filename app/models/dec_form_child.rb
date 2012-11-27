class DecFormChild < ActiveRecord::Base
   belongs_to :dec_form

            validates :complaint_author_presentator, :response_precinct_commission, :complaint_district_registration_time, :presence => true
   attr_accessible :complaint_author_presentator,
    :response_precinct_commission,
    :complaint_district_registration_time,
    :violation_essence,
    :request,
    :complaint_disscusion_time,
    :where_parties_invited_to_disscusion,
    :disscusion_people,
    :all_commission_memebers_attended,
    :report_while_meeting,
    :testimonies_investigation_evaluation,
    :extra_comments,
    :dec_desision,
    :was_desision_grounded,
    :does_pary_plans_to_complaint,
    :describe_other_extra_env,
    :created_at,
    :updated_at,
    :dec_form_id,
    :complaint_satisfied

end
