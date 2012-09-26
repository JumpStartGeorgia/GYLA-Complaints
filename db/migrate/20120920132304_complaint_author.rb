class ComplaintAuthor < ActiveRecord::Migration
  def up
      change_table :pec_forms do |t|
         t.change :complaint_author, :text
      end
  end

  def down
      change_table :pec_forms do |t|
         t.change :complaint_author, :string      
      end   
  end
end
