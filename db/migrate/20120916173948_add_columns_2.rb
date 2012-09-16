class AddColumns2 < ActiveRecord::Migration
  def up
    add_column :gitcommitfiles, :size, :integer
    add_column :gitcommits, :commit_id, :string
  end

  def down
  end
end
