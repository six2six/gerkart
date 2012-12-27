feature 'Championship Drivers feature' do
    background do
        @championship = Championship.new(:name => 'First Championship')
        @championship.save
        @championship.drivers << Driver.new(:name => 'Existing Driver')

        @driver= Driver.new(:name => 'First Driver')
        @driver.save
    end

    scenario 'should display championship\'s drivers' do
        visit '/championships/1/drivers'
        page.has_text?('First Driver')
    end

    scenario 'should add a driver to a championship' do
        visit '/championships/1/drivers'
        page.select('First Driver', :from => 'driver_id')
        page.click_button('Save changes')
    end
end
