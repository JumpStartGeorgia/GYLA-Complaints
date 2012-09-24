class RenameComplaintTables < ActiveRecord::Migration
  def up
    rename_table :complaint_general_info, :complaint_general_infos
    rename_table :complaint_additional_info, :complaint_additional_infos
  end

  def down
  end
end
