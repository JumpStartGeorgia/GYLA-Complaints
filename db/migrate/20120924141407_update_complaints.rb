class UpdateComplaints < ActiveRecord::Migration
  def up

    remove_column :complaints, :observer_name
    remove_column :complaints, :observer_address
    remove_column :complaints, :observer_phone
    remove_column :complaints, :election_district_name_id
    remove_column :complaints, :election_precinct_number_id
    remove_column :complaints, :category_id
    remove_column :complaints, :violation_type_id
    remove_column :complaints, :violation_time
    remove_column :complaints, :witness
    remove_column :complaints, :violator_info
    remove_column :complaints, :other_info
    remove_column :complaints, :status_id
    remove_column :complaints, :complaint_author_name
    remove_column :complaints, :complaint_author_phone
    remove_column :complaints, :court_name
    remove_column :complaints, :complaint_writing_time
    remove_column :complaints, :request_in_complaint
    remove_column :complaints, :response_date
    remove_column :complaints, :complaint_result
    remove_column :complaints, :additional_comment

    add_column :complaints, :original_level, :string

    create_table :complaint_general_info do |t|
      t.integer :complaint_id
      t.string :observer_name
      t.text :observer_address
      t.string :observer_phone
      t.string :election_district_name
      t.string :election_precinct_number
      t.integer :category_id
      t.integer :violation_type_id
      t.datetime :violation_time
      t.text :witness
      t.text :violator_info
      t.text :other_info

      t.timestamps
    end

    create_table :complaint_additional_info do |t|
      t.integer :complaint_id
      t.string :level
      t.integer :status_id
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




  def down

    add_column :complaints, :observer_name, :string
    add_column :complaints, :observer_address, :text
    add_column :complaints, :observer_phone, :string
    add_column :complaints, :election_district_name_id, :integer
    add_column :complaints, :election_precinct_number_id, :integer
    add_column :complaints, :category_id, :integer
    add_column :complaints, :violation_type_id, :integer
    add_column :complaints, :violation_time, :datetime
    add_column :complaints, :witness, :text
    add_column :complaints, :violator_info, :text
    add_column :complaints, :other_info, :text
    add_column :complaints, :status_id, :integer
    add_column :complaints, :complaint_author_name, :string
    add_column :complaints, :complaint_author_phone, :string
    add_column :complaints, :court_name, :text
    add_column :complaints, :complaint_writing_time, :datetime
    add_column :complaints, :request_in_complaint, :text
    add_column :complaints, :response_date, :datetime
    add_column :complaints, :complaint_result, :text
    add_column :complaints, :additional_comment, :text

    remove_column :complaints, :original_level

    drop_table :complaint_general_info
    drop_table :complaint_additional_info

  end
end
