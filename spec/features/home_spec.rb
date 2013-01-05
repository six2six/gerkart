feature 'Home Page' do
    scenario 'should have an index page' do
        visit '/'
        page.should have_text('Gerkart')
        page.should have_link('Championships')
        page.should have_link('Drivers')
        page.should have_link('Tracks')
    end
end
