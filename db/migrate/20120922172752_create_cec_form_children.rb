class CreateCecFormChildren < ActiveRecord::Migration
  def change
    create_table :cec_form_children do |t|
      t.text :cesko_complaint_author_sender
      t.string :responder_district_election_commission
      t.datetime :cesko_complaint_registration_time
      t.text :veiolation_essence
      t.text :request
      t.datetime :cesko_complaint_discation_time
      t.boolean :where_parties_invited_on_descation
      t.text :complaint_discation_people
      t.boolean :cesko_meeting_all_commission_members
      t.boolean :cesko_meeting_report
      t.boolean :cesko_meeting_testimony_research
      t.text :extra_comment
      t.text :cesko_desision
      t.boolean :was_desision_grounded
      t.boolean :was_complained_the_desision
      t.boolean :was_web_announcement_made_on_complaint
      t.text :if_not_then_precincts_and_reasons
      t.text :describe_other_extra_environments

      t.timestamps
    end
  end
end
