require 'spec_helper'

describe DriversController do
    it 'should create new drivers' do
        post(:create, :driver => {:name => 'Fulano'})
        assert_response :success
        assert_equal(Driver.find_by_name('Fulano').name, 'Fulano')
    end
end
