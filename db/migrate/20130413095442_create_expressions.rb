class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.string :francais
      t.text :commentaire
      t.string :anglais
      t.string :patois

      t.timestamps
    end
  end
end
