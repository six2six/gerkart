feature 'Ranking Configurations features' do
    background do
        create_championship
    end

    scenario 'should be able to configure points to a given position' do
        visit('/championships/1/ranking_configurations')
        fill_in 'Position', :with => '1'
        fill_in 'Points', :with => '10'
        click_button('Create Ranking configuration')

        current_path.should == '/championships/1/ranking_configurations'
        rankingConfiguration = RankingConfiguration.where(:championship_id => 1).first
        rankingConfiguration.points.should == 10
        rankingConfiguration.position.should == 1
    end

    scenario 'should be able to delete a configuration' do
        create_ranking_configuration

        visit('/championships/1/ranking_configurations')

        first(:button, 'delete').click
        current_path.should == '/championships/1/ranking_configurations'
        RankingConfiguration.where(:championship_id => 1).size.should == 1
        rankingConfiguration = RankingConfiguration.where(:championship_id => 1).first
        rankingConfiguration.points.should == 5
        rankingConfiguration.position.should == 2
    end
end
