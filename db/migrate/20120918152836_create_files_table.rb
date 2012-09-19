class CreateFilesTable < ActiveRecord::Migration
  def up

    create_table :complaint_files do |t|
      t.integer :complaint_id
      t.has_attached :file

      t.timestamps
    end

    add_index :complaint_files, :complaint_id

  end
end
