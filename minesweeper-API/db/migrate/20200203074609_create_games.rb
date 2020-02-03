class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :status
      t.integer :cant_mines
      t.integer :width
      t.integer :height
      t.bigint :user_id

      t.timestamps
    end
  end
end
