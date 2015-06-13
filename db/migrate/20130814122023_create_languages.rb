class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :description
      t.string :origin

      t.timestamps
    end
  end
end
