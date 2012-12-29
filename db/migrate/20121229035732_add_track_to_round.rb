class AddTrackToRound < ActiveRecord::Migration
  def change
    change_table :rounds do |t|
        t.references :track
    end
  end
end
