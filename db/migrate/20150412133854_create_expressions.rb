class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.text :french
      t.text :english
      t.text :trans

      t.timestamps
    end
  end
end
