class AddInfoidColumn < ActiveRecord::Migration
  def change
    add_column :complaint_files, :additional_info_id, :string
  end
end
