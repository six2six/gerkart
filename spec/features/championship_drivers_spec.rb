feature 'Championship Drivers feature' do
    background do
        create_championship_with_drivers [create_driver]
    end

    scenario 'should display championship\'s drivers' do
        visit '/championships/1/drivers'
        @default_championship.drivers.each do |driver|
            page.should have_text(driver.name)
        end
    end

    scenario 'should add a driver to a championship' do
        create_driver(:name => 'Independent Driver')

        visit '/championships/1/drivers'
        page.select('Independent Driver', :from => 'driver_id')
        page.click_button('Save changes')
    end
end
