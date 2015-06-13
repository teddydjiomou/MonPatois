class CreateMots < ActiveRecord::Migration
  def change
    create_table :mots do |t|
      t.string :francais
      t.text :commentaire
      t.string :anglais
      t.string :patois

      t.timestamps
    end
  end
end
