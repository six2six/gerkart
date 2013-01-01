module Helpers
    def create_championship(opts={:name => 'Default Championship'})
        @default_championship = Championship.create(opts)
    end

    def create_driver(opts={:name => 'First Default Driver'})
        @default_driver = Driver.create(opts)
    end

    def create_track(opts={:name => 'Default Track'})
        @default_track = Track.create(opts)
    end

    def create_championship_with_drivers drivers
        create_championship
        drivers.each { |driver| @default_championship.drivers << driver }
    end

    def create_round opts
        round = Round.new(opts.slice(:name, :date))
        round.championship = @default_championship
        round.track = opts[:track]
        round.save
        opts[:roundPositions].each do |standing|
            roundPosition = round.roundPositions.build(standing.slice(:position, :total_time))
            roundPosition.driver = standing[:driver]
            roundPosition.save
        end
    end
end

