require 'spec_helper'

describe DriversController do
    it 'should create new drivers' do
        post(:create, :driver => {:name => 'Fulano'})
        response.should redirect_to driver_path(assigns(:driver))
        assert_equal(Driver.find_by_name('Fulano').name, 'Fulano')
    end

    it 'should assign all drivers' do
        Driver.create(:name => 'Fulano')
        Driver.create(:name => 'Beltrano')

        get(:index)
        assigns(:drivers).size.should == 2
    end
end
