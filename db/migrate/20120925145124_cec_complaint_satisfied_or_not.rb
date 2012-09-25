class CecComplaintSatisfiedOrNot < ActiveRecord::Migration
  def up
      add_column :cec_form_children, :was_complaint_satisfied, :boolean
  end

  def down
      remove_column :cec_form_children, :was_complaint_satisfied
  end
end
