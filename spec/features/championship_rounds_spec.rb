feature 'Championship Rounds feature' do
    background do
        create_championship_with_drivers [create_driver(:name => 'One'), create_driver(:name => 'Two')]
        create_track
    end

    scenario 'should add a round to the championship' do
        visit '/championships/1/rounds/new'
        @default_championship.drivers.each do |driver|
            page.should have_content(driver.name)
        end

        fill_in 'Date', :with => Date.yesterday
        fill_in 'Name', :with => 'Default Round'
        select 'Default Track', :from => 'Track'

        fill_in 'round[roundPosition][1][position]', :with => 2
        fill_in 'round[roundPosition][2][position]', :with => 1

        click_button 'Create Round'
        current_path.should == '/championships/1/rounds/1'

        Round.find_by_id(1).name.should == 'Default Round'
        Round.find_by_id(1).track.name.should == 'Default Track'
        roundPositions = RoundPosition.find_all_by_round_id(1)
        roundPositions.each do |roundPosition|
            if roundPosition.position == 1
                roundPosition.driver.should == @default_championship.drivers[1]
            else
                roundPosition.driver.should == @default_championship.drivers[0]
            end
        end
    end
end
