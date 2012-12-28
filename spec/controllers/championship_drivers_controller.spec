describe ChampionshipDriversController do
    before :each do
        @championship = Championship.new(:name => 'Default Championship')
        @championship.save

        @driver = Driver.new(:name => 'Available Driver')
        @driver.save
    end

    it 'should assign available drivers to add to championship' do
        get(:index, :championship_id => 1)
        assert_not_nil assigns(:available_drivers)
        assert_equal(assigns(:available_drivers)[0].name, 'Available Driver')
    end

    it 'should add drivers to a championship' do
        post(:create, :championship_id => 1, :driver_id => [1])
        response.should redirect_to(championship_drivers_url)
        assert_equal(@championship.drivers[0].name, 'Available Driver')
    end
end
