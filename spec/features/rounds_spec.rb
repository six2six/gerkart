feature 'Championship Rounds feature' do
    background do
        @championship = Championship.new
        @championship.save

        @one_driver = Driver.new(:name => 'One Driver')
        @one_driver.save
        @other_driver = Driver.new(:name => 'Other Driver')
        @other_driver.save

        @championship.drivers << @one_driver
        @championship.drivers << @other_driver

        @track = Track.new(:name => 'A Track')
        @track.save
    end

    scenario 'should add a round to the championship' do
        visit '/championships/1/rounds/new'
        fill_in 'Date', :with => Date.yesterday
        fill_in 'Name', :with => 'A Round'
        select 'A Track', :from => 'Track'

        page.should have_content(@one_driver.name)
        page.should have_content(@other_driver.name)
        fill_in 'round[roundPosition][1][position]', :with => 1

        click_button 'Create Round'
        current_path.should == '/championships/1/rounds/1'

        page.should have_text(@one_driver.name)
        page.should have_text(@other_driver.name)
    end
end
