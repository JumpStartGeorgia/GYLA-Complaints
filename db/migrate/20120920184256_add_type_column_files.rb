class AddTypeColumnFiles < ActiveRecord::Migration
  def up
    add_column :complaint_files, :type, :string
  end

  def down
    remove_column :complaint_files, :type
  end
end
