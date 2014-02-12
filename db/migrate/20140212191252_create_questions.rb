class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.integer :number
      t.integer :item_a
      t.integer :item_b

      t.timestamps
    end
    add_index :questions, [:test_id, :created_at]
  end
end
