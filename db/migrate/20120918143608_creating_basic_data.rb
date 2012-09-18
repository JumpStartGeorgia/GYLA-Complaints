class CreatingBasicData < ActiveRecord::Migration
  def up

    create_table :election_district_names do |t|
      t.string :title
      t.timestamps
    end

    create_table :election_precinct_numbers do |t|
      t.string :title
      t.timestamps
    end

    create_table :categories do |t|
      t.string :title
      t.timestamps
    end

    create_table :violation_types do |t|
      t.string :title
      t.timestamps
    end

    create_table :statuses do |t|
      t.string :title
      t.timestamps
    end

  end
end
