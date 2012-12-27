describe ChampionshipsController do
    it 'should create a new championship' do
        post(:create, :championship => {:name => 'Default Championship'})

        assert_not_nil Championship.find_by_name('Default Championship')
        assert_equal(assigns(:championship).name, 'Default Championship')
    end

    it 'should assign championship\'s drivers' do
        championship = Championship.new(:name => 'Default Championship')
        driver = Driver.new(:name => 'Default Driver')
        championship.drivers << driver
        championship.save

        get(:show, {:id => championship.id})

        assert_equal(assigns(:championship).drivers[0], driver)
    end
end
