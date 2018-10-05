class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.integer :user_id
      t.integer :luck_id
      t.integer :point
      t.text :image
      t.timestamps
    end
  end
end
