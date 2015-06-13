class CreateAnglais < ActiveRecord::Migration
  def change
    create_table :anglais do |t|
      t.string :mot

      t.timestamps
    end
  end
end
