class CreateGitcommits < ActiveRecord::Migration
  def up
    create_table :gitcommits do |t|
      t.string :name
    end
  end

  def down
    drop_table :gitcommits
  end
end
