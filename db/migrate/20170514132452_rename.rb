class Rename < ActiveRecord::Migration[5.1]
  def change
  	rename_column :videos, :type, :ty 
  end
end
