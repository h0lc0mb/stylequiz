class AddLoseToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :lose, :integer
  end
end
