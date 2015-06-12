class AddTranslastionIdToVotations < ActiveRecord::Migration
  def change
    add_column :votations, :translation_id, :integer
  end
end
