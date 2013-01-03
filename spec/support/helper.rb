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

    def create_championship_rounds
        create_round({
            :name => 'Round 1', :date => 10.days.ago, :track => @default_track,
            :roundPositions => [
                { :position => 1, :total_time => '2012/10/12 1:00:00', :driver => @default_championship.drivers[0] },
                { :position => 2, :total_time => '2012/10/12 1:14:00', :driver => @default_championship.drivers[1] }
            ]
        })
        create_round({
            :name => 'Round 2', :date => 5.days.ago, :track => @default_track,
            :roundPositions => [
               { :position => 1, :total_time => Date.parse('2012/10/12 1:15:00'), :driver => @default_championship.drivers[0] },
               { :position => 2, :total_time => Date.parse('2012/10/12 1:03:00'), :driver => @default_championship.drivers[1] }
            ]
        })
    end

    def create_ranking_configuration
        configuration = RankingConfiguration.new(:position => 1, :points => 10)
        configuration.championship = @default_championship
        configuration.save

        configuration = RankingConfiguration.new(:position => 2, :points => 5)
        configuration.championship = @default_championship
        configuration.save
    end
end

