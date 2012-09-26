class AllDateToString < ActiveRecord::Migration
  def up
      change_column :pec_forms, :registration_time, :string
      change_column :dec_form_children, :complaint_district_registration_time, :string
      change_column :dec_form_children, :complaint_disscusion_time, :string
      change_column :cec_form_children, :cesko_complaint_registration_time, :string
      change_column :cec_form_children, :cesko_complaint_discation_time, :string
  end

  def down
      change_column :pec_forms, :registration_time, :datetime
      change_column :dec_form_children, :complaint_district_registration_time, :datetime
      change_column :dec_form_children, :complaint_disscusion_time, :datetime
      change_column :cec_form_children, :cesko_complaint_registration_time, :datetime
      change_column :cec_form_children, :cesko_complaint_discation_time, :datetime
  end
end
