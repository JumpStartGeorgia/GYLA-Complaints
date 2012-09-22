class DecFormIdToChild < ActiveRecord::Migration
  def up
      add_column :dec_form_children, :dec_form_id, :integer
  end

  def down
      remove_column :dec_form_children, :dec_form_id
  end
end
