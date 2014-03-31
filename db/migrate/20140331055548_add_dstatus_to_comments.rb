class AddDstatusToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :dstatus, :boolean, default: false 
  end
end
