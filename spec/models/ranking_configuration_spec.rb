describe RankingConfiguration do
    before do
        create_championship
        create_ranking_configuration
    end

    it 'should return configuration as hash' do
        configuration = RankingConfiguration.build_for(@default_championship)
        configuration.should be_an_instance_of(Hash)
        configuration[1].should == 10
        configuration[2].should == 5
    end
end
