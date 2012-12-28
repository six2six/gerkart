require 'spec_helper'

describe DriversController do
    it 'should create new drivers' do
        post(:create, :driver => {:name => 'Fulano'})
        response.should redirect_to driver_path(assigns(:driver))
        assert_equal(Driver.find_by_name('Fulano').name, 'Fulano')
    end
end
