class ChangeDataTypeForDescriptionInLanguage < ActiveRecord::Migration
  def up
    change_table :languages do |l|
      l.change :description, :text
    end
  end

  def down
    change_table :languages do |l|
      l.change :description, :string
    end
  end
end
