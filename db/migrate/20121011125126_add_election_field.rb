class AddElectionField < ActiveRecord::Migration
  def up
    add_column :complaints, :election, :string
  end

  def down
    remove_column :complaints, :election
  end
end
