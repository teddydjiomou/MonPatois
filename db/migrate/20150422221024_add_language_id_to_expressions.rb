class AddLanguageIdToExpressions < ActiveRecord::Migration
  def change
    add_column :expressions, :language_id, :integer
  end
end
