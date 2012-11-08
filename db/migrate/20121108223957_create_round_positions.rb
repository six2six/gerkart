class CreateRoundPositions < ActiveRecord::Migration
  def change
    create_table :round_positions do |t|
      t.integer :position
      t.references :driver
      t.time :total_time

      t.timestamps
    end
    add_index :round_positions, :driver_id
  end
end
