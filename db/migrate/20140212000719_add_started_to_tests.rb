class AddStartedToTests < ActiveRecord::Migration
  def change
    add_column :tests, :started, :boolean
  end
end
