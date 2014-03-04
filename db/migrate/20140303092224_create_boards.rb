class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.text :title
      t.text :subtitle

      t.timestamps
    end
  end
end
