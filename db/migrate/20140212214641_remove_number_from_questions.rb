class RemoveNumberFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :number
  end

  def down
    add_column :questions, :number, :integer
  end
end
