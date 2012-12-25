class AddChampionshipsToDrivers < ActiveRecord::Migration
    def up
        create_table :championships_drivers do |t|
            t.references :championship
            t.references :driver
        end
    end

    def down
        drop_table :championships_drivers
    end
end
