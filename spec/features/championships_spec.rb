feature 'Championships feature' do
    background do
        @championship = Championship.new(:name => 'First Championship')
        @championship.drivers << Driver.new(:name => 'First Driver')

        @championship.save
    end

    scenario 'should have a link to create a championship' do
        visit '/championships'
        page.should have_link('Create Championship', '/championships/new')
    end

    scenario 'should create a championship' do
        visit '/championships/new'
        fill_in 'Name', :with => 'My Championship'
        click_button('Create Championship')
        current_path.should == '/championships/2'
    end

    scenario 'should display the championship\'s name' do
        visit '/championships/1'
        page.should have_text(@championship.name)
    end

    scenario 'should have a link to the championship\'s drivers' do
        visit '/championships/1'
        page.should have_link('Drivers', '/championships/1/drivers')
    end

    scenario 'should have a link to the championship\'s rounds' do
        visit '/championships/1'
        page.should have_link('Rounds', '/championships/1/rounds')
    end
end
