feature 'Championships feature' do
    background do
        @championship = Championship.new(:name => 'First Championship')
        @championship.drivers << Driver.new(:name => 'First Driver')

        @championship.save
    end

    scenario 'should have a link to create a championship' do
        visit '/championships'
        has_link?('/championships/new')
    end

    scenario 'should create a championship' do
        visit '/championships/new'
        fill_in 'Name', :with => 'My Championship'
        click_button('Create Championship')
        assert page.has_content?('My Championship')
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
