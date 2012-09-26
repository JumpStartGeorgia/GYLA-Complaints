class CreateDecForms < ActiveRecord::Migration
  def change
    create_table :dec_forms do |t|
      t.integer :dec_total_complaints
      t.boolean :dec_journal_registration_yes_no
      t.boolean :ped_entered_with_law
      t.boolean :lonked_election_lists
      t.boolean :complaints
      t.boolean :get_send_act
      t.text :describe_extra_env
      t.boolean :was_canonical_procedures_done
      t.boolean :where_props_filled
      t.boolean :precinct_results_canel_proc
      t.boolean :commission_summary_report_publicity
      t.text :extra_env_describe
      t.boolean :summed_up_or_not_summary_reports

      t.timestamps
    end
  end
end
