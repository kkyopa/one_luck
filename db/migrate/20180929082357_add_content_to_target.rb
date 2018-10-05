class AddContentToTarget < ActiveRecord::Migration[5.1]
  def change
    add_column :targets, :content, :text
  end
end
