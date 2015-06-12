class AddExpressionIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :expression_id, :integer
  end
end
