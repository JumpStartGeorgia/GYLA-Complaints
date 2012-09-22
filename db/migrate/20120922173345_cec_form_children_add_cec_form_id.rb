class CecFormChildrenAddCecFormId < ActiveRecord::Migration
  def up
      add_column :cec_form_children, :cec_form_id, :integer
  end

  def down
      remove_column :cec_form_children, :cec_form_id
  end
end
