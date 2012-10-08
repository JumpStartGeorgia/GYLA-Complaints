class AddOldColumnsToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :status_old, :string
  end
end
