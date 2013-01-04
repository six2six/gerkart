describe ChampionshipsController do
    it 'should create a new championship' do
        post(:create, :championship => {:name => 'Default Championship'})

        response.should redirect_to(championship_path(assigns(:championship)))

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


    it 'should assign all the championships' do
        Championship.create(:name => 'Default Championship')
        Championship.create(:name => 'Default Championship')

        get(:index)

        assigns(:championships).size.should == 2
    end

end
