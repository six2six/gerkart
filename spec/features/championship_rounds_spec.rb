feature 'Championship Rounds feature' do
    background do
        create_championship_with_drivers [create_driver(:name => 'One'), create_driver(:name => 'Two'), create_driver(:name => 'Three')]
        create_track
    end

    scenario 'should add a round to the championship' do
        visit '/championships/1/rounds/new'
        @default_championship.drivers.each do |driver|
            page.should have_content(driver.name)
        end

        fill_in 'Date', :with => '2012/10/13'
        fill_in 'Name', :with => 'Default Round'
        select 'Default Track', :from => 'Track'

        fill_in 'round[roundPositions_attributes][0][position]', :with => 2
        fill_in 'round[roundPositions_attributes][1][position]', :with => 1

        fill_in 'round[roundPositions_attributes][0][total_time]', :with => '01:01:01'
        fill_in 'round[roundPositions_attributes][1][total_time]', :with => '01:05:01'

        click_button 'Create Round'
        current_path.should == '/championships/1/rounds/1'

        Round.find_by_id(1).name.should == 'Default Round'
        Round.find_by_id(1).track.name.should == 'Default Track'
        roundPositions = RoundPosition.find_all_by_round_id(1)
        roundPositions.length.should == 2
        roundPositions.each do |roundPosition|
            if roundPosition.position == 1
                roundPosition.driver.should == @default_championship.drivers[1]
            else
                roundPosition.driver.should == @default_championship.drivers[0]
            end
        end
    end

    scenario 'should list championship rounds' do
        create_championship_rounds
        visit('/championships/1/rounds')
        page.should have_text 'Round 1'
        page.should have_text 'Round 2'
    end

    scenario 'should edit the position of a driver' do
        create_championship_rounds
        visit '/championships/1/rounds/1/edit'
        field = find_field 'round[roundPositions_attributes][0][position]'
        field.value.should == '1'
        fill_in 'round[roundPositions_attributes][0][position]', :with => 3
        click_button 'Update Round'
        current_path.should == '/championships/1/rounds/1'
        roundPositions = RoundPosition.find_all_by_round_id(1)
        roundPositions.length.should == 2
        roundPositions.each do |roundPosition|
            if roundPosition.position == 2
                roundPosition.driver.should == @default_championship.drivers[1]
            else
                roundPosition.position.should == 3
                roundPosition.driver.should == @default_championship.drivers[0]
            end
        end
    end
end
