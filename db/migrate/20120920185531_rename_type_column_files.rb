class RenameTypeColumnFiles < ActiveRecord::Migration
  def up
    rename_column :complaint_files, :type, :attachment_type
  end

  def down
    rename_column :complaint_files, :attachment_type, :type
  end
end
