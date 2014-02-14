class CreateTagpairs < ActiveRecord::Migration
  def change
    create_table :tagpairs do |t|
      t.integer :item
      t.string :tag_a
      t.string :tag_b

      t.timestamps
    end
  end
end
