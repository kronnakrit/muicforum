class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :topic, index: true
      t.references :user, index: true

      t.timestamps
    end
    add_index :comments, [:topic_id, :user_id, :created_at]
  end
end
