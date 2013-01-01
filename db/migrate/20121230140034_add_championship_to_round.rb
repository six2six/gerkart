class AddChampionshipToRound < ActiveRecord::Migration
    change_table :rounds do |t|
        t.references :championship
    end
end
