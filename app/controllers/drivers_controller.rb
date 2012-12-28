class DriversController < ApplicationController
    def new
        @driver = Driver.new
    end

    def create
        @driver = Driver.new(params[:driver])
        @driver.save

        redirect_to :action => :show, :id => @driver.id
    end

    def show
        @driver = Driver.find(params[:id])
    end
end
