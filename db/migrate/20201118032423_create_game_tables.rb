class CreateGameTables < ActiveRecord::Migration[6.0]
  def change
    create_table :game_tables do |t|
      t.integer :row
      t.integer :column
      t.boolean :is_select
      t.boolean :is_mine
      t.boolean :is_band
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
