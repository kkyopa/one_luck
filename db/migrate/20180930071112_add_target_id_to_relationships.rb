class AddTargetIdToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :relationships, :target_id, :integer
  end
end
