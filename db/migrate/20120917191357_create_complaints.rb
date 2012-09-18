class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :observer_name
      t.text :observer_address
      t.string :observer_phone
      t.integer :election_district_name
      t.integer :election_precinct_number
      t.integer :category
      t.integer :violation_type
      t.datetime :violation_time
      t.text :witness
      t.text :violator_info
      t.text :other_info
      t.string :status
      t.string :complaint_author_name
      t.string :complaint_author_phone
      t.text :court_name
      t.datetime :complaint_writing_time
      t.text :request_in_complaint
      t.datetime :response_date
      t.text :complaint_result
      t.text :additional_comment

      t.timestamps
    end
  end
end
