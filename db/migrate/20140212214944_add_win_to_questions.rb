class AddWinToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :win, :string
  end
end
