class AddExpressionIdToVotations < ActiveRecord::Migration
  def change
    add_column :votations, :expression_id, :integer
  end
end
