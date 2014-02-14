class AddWinToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :win, :integer
  end
end
