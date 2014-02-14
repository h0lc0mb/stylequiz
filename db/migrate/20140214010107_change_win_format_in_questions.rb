class ChangeWinFormatInQuestions < ActiveRecord::Migration
  def up
  	connection.execute(%q{
    alter table questions
    alter column win
    type integer using cast(win as integer)
  })
  end

  def down
  	change_column :questions, :win, :string
  end
end
