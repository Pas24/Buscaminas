class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :rows
      t.integer :columns
      t.integer :mines
      t.string :score
      t.integer :status

      t.timestamps
    end
  end
end
