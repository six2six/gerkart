require 'spec_helper'

describe Championship do
    before do
        create_championship_with_drivers [create_driver(:name => 'One'), create_driver(:name => 'Two'), create_driver(:name => 'Never Races')]
        create_track
    end

    it 'should build a sorted ranking' do
        create_championship_rounds
        create_ranking_configuration
        ranking = @default_championship.build_ranking
        ranking.values[0][:points].should == 10
        ranking.keys[0].name == 'One'
    end
end
