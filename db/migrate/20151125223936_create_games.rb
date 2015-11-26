class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :first_player_id, null: false
      t.integer :second_player_id
      t.string :room_name, null: false

      t.timestamps
    end
  end
end
