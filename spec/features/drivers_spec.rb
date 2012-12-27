feature 'Drivers feature' do
    background do
        @driver = Driver.new(:name => 'First Driver')
        @driver.save
    end

    scenario 'should display a driver' do
        visit '/drivers/1'
        assert page.has_text?('First Driver')
    end

    scenario 'should create a driver' do
        visit '/drivers/new'
        fill_in 'Name', :with => 'One Driver'
        click_button('Create Driver')
        assert page.has_content?('One Driver')
    end
end
