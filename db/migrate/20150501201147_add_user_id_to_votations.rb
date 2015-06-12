class AddUserIdToVotations < ActiveRecord::Migration
  def change
    add_column :votations, :user_id, :integer
  end
end
