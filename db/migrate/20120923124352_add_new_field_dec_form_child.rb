class AddNewFieldDecFormChild < ActiveRecord::Migration
  def up
      add_column :dec_form_children, :complaint_satisfied, :boolean
  end

  def down
      remove_column :dec_form_children, :complaint_satisfied
  end
end
