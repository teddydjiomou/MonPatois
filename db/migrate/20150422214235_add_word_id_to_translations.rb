class AddWordIdToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :word_id, :integer
  end
end
