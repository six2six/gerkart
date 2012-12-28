feature 'Tracks feature' do

    background do
        Track.new(:name => 'Default Track').save
    end

    scenario 'should have a page to create a new track' do
        visit '/tracks/new'
        fill_in 'Name', :with => 'One Track'
        click_button 'Create Track'
        assert page.has_text?('One Track')
    end

    scenario 'should display previously created tracks' do
        visit '/tracks'
        assert page.has_text?('Default Track')
    end
end
