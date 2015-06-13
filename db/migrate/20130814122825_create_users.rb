class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :hashed_password
      t.string :mail

      t.timestamps
    end
  end
end
