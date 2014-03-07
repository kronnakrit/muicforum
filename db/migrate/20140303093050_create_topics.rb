class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :subtitle
      t.references :user, index: true
      t.references :board, index: true

      t.timestamps
    end
    add_index :topics, [:user_id, :board_id, :created_at]
  end
end
