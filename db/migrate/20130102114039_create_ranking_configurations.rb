class CreateRankingConfigurations < ActiveRecord::Migration
  def change
    create_table :ranking_configurations do |t|
      t.references :championship
      t.integer :position
      t.integer :points

      t.timestamps
    end
    add_index :ranking_configurations, :championship_id
  end
end
