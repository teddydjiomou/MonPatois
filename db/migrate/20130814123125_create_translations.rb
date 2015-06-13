class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :trans

      t.timestamps
    end
  end
end
