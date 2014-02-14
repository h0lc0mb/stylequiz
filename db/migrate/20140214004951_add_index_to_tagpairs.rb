class AddIndexToTagpairs < ActiveRecord::Migration
  def change
  	add_index :tagpairs, :item
  end
end
