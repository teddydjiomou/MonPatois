class AddExpressionIdToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :expression_id, :integer
  end
end
