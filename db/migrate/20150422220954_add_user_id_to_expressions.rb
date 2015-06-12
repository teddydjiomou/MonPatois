class AddUserIdToExpressions < ActiveRecord::Migration
  def change
    add_column :expressions, :user_id, :integer
  end
end
