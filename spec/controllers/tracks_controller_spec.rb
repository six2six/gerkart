require 'spec_helper'

describe TracksController do

    before(:each) do
        Track.new(:name => 'Default Track').save
    end

    it 'should create new track' do
        post(:create, :track => {:name => 'A Track'})
        response.should redirect_to(tracks_url)
        assert_equal(Track.find_by_name('A Track').name, 'A Track')
    end

    it 'should assign all tracks' do
        get(:index)
        assert assigns(:tracks)[0].name = 'Default Track'
    end
end
