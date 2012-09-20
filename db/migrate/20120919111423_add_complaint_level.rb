class AddComplaintLevel < ActiveRecord::Migration
  def up
    add_column :complaints, :level, :string
  end

  def down
    remove_column :complaints, :level
  end
end
