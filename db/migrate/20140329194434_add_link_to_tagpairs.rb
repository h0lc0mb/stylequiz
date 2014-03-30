class AddLinkToTagpairs < ActiveRecord::Migration
  def change
    add_column :tagpairs, :link, :string
  end
end
