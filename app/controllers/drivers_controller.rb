class DriversController < ApplicationController
    def new
        @driver = Driver.new
    end

    def index
        @drivers = Driver.all
    end

    def create
        @driver = Driver.create(params[:driver])

        redirect_to :action => :show, :id => @driver.id
    end

    def show
        @driver = Driver.find(params[:id])
    end
end
