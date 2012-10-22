class FixPecRegisteredComplaintValue < ActiveRecord::Migration
  def up
		# the registered_or_not_complaint field was missing from the model attr_accessible so no value was being saved
		# assume if have date, then value should be true
		PecForm.where("registration_time is not null").update_all(:registered_or_not_complaint => true)
  end

  def down
		PecForm.update_all(:registered_or_not_complaint => nil)
  end
end
