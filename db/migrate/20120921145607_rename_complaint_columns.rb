class RenameComplaintColumns < ActiveRecord::Migration
  def up

    rename_column :complaints, :election_district_name, :election_district_name_id
    rename_column :complaints, :election_precinct_number, :election_precinct_number_id
    rename_column :complaints, :category, :category_id
    rename_column :complaints, :violation_type, :violation_type_id
    rename_column :complaints, :status, :status_id

  end

  def down

    rename_column :complaints, :election_district_name_id, :election_district_name
    rename_column :complaints, :election_precinct_number_id, :election_precinct_number
    rename_column :complaints, :category_id, :category
    rename_column :complaints, :violation_type_id, :violation_type
    rename_column :complaints, :status_id, :status

  end
end
