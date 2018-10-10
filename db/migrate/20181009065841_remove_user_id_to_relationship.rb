class RemoveUserIdToRelationship < ActiveRecord::Migration[5.1]
  def change
    remove_column :relationships, :user_id, :integer
    remove_column :relationships, :luck_id, :integer
    remove_column :relationships, :target_id, :integer
  end
end
