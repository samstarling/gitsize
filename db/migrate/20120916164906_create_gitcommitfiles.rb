class CreateGitcommitfiles < ActiveRecord::Migration
  def up
    create_table :gitcommitfiles do |t|
      t.string :name
    end
  end

  def down
    drop_table :gitcommitfiles
  end
end
