class RegisteredOrNot < ActiveRecord::Migration
  def up
      add_column :pec_forms, :registered_or_not_complaint, :boolean
  end

  def down
      remove_column :pec_forms, :registered_or_not_complaint
  end
end
