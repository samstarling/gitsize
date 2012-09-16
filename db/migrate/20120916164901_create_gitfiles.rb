class CreateGitfiles < ActiveRecord::Migration
  def up
    create_table :gitfiles do |t|
      t.string :name
    end
  end

  def down
    drop_table :gitfiles
  end
end
