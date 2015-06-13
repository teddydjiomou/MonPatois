class CreateFrancais < ActiveRecord::Migration
  def change
    create_table :francais do |t|
      t.string :mot

      t.timestamps
    end
  end
end
