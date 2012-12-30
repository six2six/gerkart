feature 'Drivers feature' do
    background do
        create_driver
    end

    scenario 'should display a driver' do
        visit '/drivers/1'
        page.should have_text(@default_driver.name)
    end

    scenario 'should create a driver' do
        visit '/drivers/new'
        fill_in 'Name', :with => 'One Driver'
        click_button('Create Driver')
        current_path.should == '/drivers/2'
    end
end
