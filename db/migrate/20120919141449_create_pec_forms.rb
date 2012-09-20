class CreatePecForms < ActiveRecord::Migration
  def change
    create_table :pec_forms do |t|
      t.integer :election_district_number
      t.integer :election_precinct_number
      t.string :observer_name
      t.integer :current_number_of_complaints
      t.string :complaint_author
      t.datetime :registration_time
      t.boolean :do_you_give_complaint_to_higher_commission
      t.text :violation_essence
      t.text :request
      t.boolean :was_complaint_setisfied
      t.text :other_extra_comments

      t.timestamps
    end
  end
end
