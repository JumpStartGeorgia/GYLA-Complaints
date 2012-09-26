class CreateCecForms < ActiveRecord::Migration
  def change
    create_table :cec_forms do |t|
      t.boolean :cesko_summary_report_input
      t.text :if_not_precinct_name_and_num
      t.boolean :cesko_election_summary_after_one_day
      t.text :if_not_after_one_day_precinct_name_num
      t.boolean :cesko_report_web_translition
      t.text :if_not_the_reason
      t.boolean :cesko_summary_process_transparently
      t.text :description_how_transparent

      t.timestamps
    end
  end
end
