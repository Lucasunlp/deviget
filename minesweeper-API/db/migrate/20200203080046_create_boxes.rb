class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.integer :x
      t.integer :y
      t.integer :cant_mines
      t.integer :game_id
      t.boolean :mine
      t.boolean :opened
      t.boolean :flag

      t.timestamps
    end
  end
end
