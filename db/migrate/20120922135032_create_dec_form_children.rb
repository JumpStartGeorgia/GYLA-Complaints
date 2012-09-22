class CreateDecFormChildren < ActiveRecord::Migration
  def change
    create_table :dec_form_children do |t|
      t.string :complaint_author_presentator
      t.string :response_precinct_commission
      t.datetime :complaint_district_registration_time
      t.text :violation_essence
      t.text :request
      t.datetime :complaint_disscusion_time
      t.boolean :where_parties_invited_to_disscusion
      t.text :disscusion_people
      t.boolean :all_commission_memebers_attended
      t.boolean :report_while_meeting
      t.boolean :testimonies_investigation_evaluation
      t.text :extra_comments
      t.text :dec_desision
      t.boolean :was_desision_grounded
      t.boolean :does_pary_plans_to_complaint
      t.text :describe_other_extra_env

      t.timestamps
    end
  end
end
