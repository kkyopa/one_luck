class CreateLucks < ActiveRecord::Migration[5.1]
  def change
    create_table :lucks do |t|
      t.integer :user_id
      t.string :content
      t.text :image
      t.timestamps
    end
  end
end
