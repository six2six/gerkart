feature 'Tracks feature' do
    background do
        create_track
    end

    scenario 'should display previously created tracks' do
        visit '/tracks'
        page.should have_text(@default_track.name)
    end

    scenario 'should create a track' do
        visit '/tracks/new'
        fill_in 'Name', :with => 'One Track'
        click_button 'Create Track'
        page.should have_text('One Track')
    end
end
