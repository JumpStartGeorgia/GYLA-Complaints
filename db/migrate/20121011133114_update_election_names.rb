class UpdateElectionNames < ActiveRecord::Migration
  def up
    elections = Complaint::ELECTIONS
    Complaint.where(:status_old => nil).update_all(:election => elections[elections.length - 1][1])
    Complaint.where('status_old IS NOT NULL').update_all(:election => elections[0][1])
  end

  def down
  end
end
