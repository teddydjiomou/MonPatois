class CreateLangues < ActiveRecord::Migration
  def change
    create_table :langues do |t|
      t.string :nome
      t.text :desctiption
      t.string :origine

      t.timestamps
    end
  end
end
