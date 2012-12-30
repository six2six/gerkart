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
        fill_in 'Name', :with => 'Default  Round'
        select 'Default Track', :from => 'Track'

        fill_in 'round[roundPosition][1][position]', :with => 1

        click_button 'Create Round'
        current_path.should == '/championships/1/rounds/1'

        @default_championship.drivers do |driver|
            page.should have_text(driver.name)
        end
    end
end
