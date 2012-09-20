class AddAttachmentToComplaints < ActiveRecord::Migration
  def self.up
    create_table :complaint_files do |t|
      t.integer :complaint_id
      t.has_attached_file :file
      t.timestamps
    end
    add_index :complaint_files, :complaint_id
  end

  def self.down
    drop_table :complaint_files
    remove_index :complaint_Files, :complaint_id
  end
end
