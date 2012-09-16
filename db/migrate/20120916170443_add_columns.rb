class AddColumns < ActiveRecord::Migration
  def up
    add_column :gitcommitfiles, :gitcommit_id, :integer
    add_column :gitcommitfiles, :gitfile_id, :integer
  end

  def down
  end
end
