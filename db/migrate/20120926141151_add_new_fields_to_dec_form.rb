class AddNewFieldsToDecForm < ActiveRecord::Migration
  def change
      # new columns for dec form
      add_column :dec_forms, :district_name_id, :integer
      add_column :dec_forms, :observer_name, :string
      add_column :dec_forms, :monitoring_time, :string
      add_column :dec_forms, :organisation_name, :string
      
      # new columns for cec form
      add_column :cec_forms, :cesko_list_observer, :string
      add_column :cec_forms, :monitoring_time, :string
      add_column :cec_forms, :organization_name, :string
      
  end
end
