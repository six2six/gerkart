class AddRoundToRoundPosition < ActiveRecord::Migration
  def change
    change_table :round_positions do |t|
        t.references :round
    end
  end
end
