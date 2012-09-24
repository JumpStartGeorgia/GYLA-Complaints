class WasCanonicalProcedursDoneToInteger < ActiveRecord::Migration
  def up
      change_column :dec_forms, :was_canonical_procedures_done, :integer
  end

  def down
      change_column :dec_forms, :was_canonical_procedures_done, :boolean
  end
end
