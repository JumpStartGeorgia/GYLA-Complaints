class PecFormMoveColumn < ActiveRecord::Migration
  def up
      remove_column :pec_forms, :registered_or_not_complaint
      add_column :pec_forms, :registered_or_not_complaint, :boolean, :after => :complaint_author
  end

  def down      
  end
end
