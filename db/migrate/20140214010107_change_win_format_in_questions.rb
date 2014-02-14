class ChangeWinFormatInQuestions < ActiveRecord::Migration
  def up
  	change_column :questions, :win, :integer
  end

  def down
  	change_column :questions, :win, :string
  end
end
