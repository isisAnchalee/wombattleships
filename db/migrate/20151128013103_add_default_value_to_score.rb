class AddDefaultValueToScore < ActiveRecord::Migration
  def change
    change_column_default :users, :score, 0
  end
end
