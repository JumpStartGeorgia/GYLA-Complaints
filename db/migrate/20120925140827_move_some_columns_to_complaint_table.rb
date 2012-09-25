class MoveSomeColumnsToComplaintTable < ActiveRecord::Migration
  def up
    drop_table :complaint_general_infos

    add_column :complaints, :observer_name, :string
    add_column :complaints, :observer_address, :text
    add_column :complaints, :observer_phone, :string
    add_column :complaints, :election_district_name, :integer
    add_column :complaints, :election_precinct_number, :integer
    add_column :complaints, :category_id, :integer
    add_column :complaints, :violation_type_id, :integer
    add_column :complaints, :violation_time, :datetime
    add_column :complaints, :witness, :text
    add_column :complaints, :violator_info, :text
    add_column :complaints, :other_info, :text
    
  end

  def down
  end
end
