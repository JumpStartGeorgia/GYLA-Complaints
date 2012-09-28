class AddDescriptionFieldToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :description, :text
  end
end
