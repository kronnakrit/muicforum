class RemoveBoardIdFromComment < ActiveRecord::Migration
  def change
    remove_column :comments, :board_id, :integer
  end
end
