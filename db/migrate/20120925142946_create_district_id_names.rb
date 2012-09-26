class CreateDistrictIdNames < ActiveRecord::Migration
  def change
    create_table :district_id_names do |t|
      t.integer :district_id
      t.string :district_name

      t.timestamps
    end
  end
end
