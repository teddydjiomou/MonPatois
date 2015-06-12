class AddVerifyToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :verify, :string
  end
end
