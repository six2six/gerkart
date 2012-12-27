class ChampionshipDriversController < ApplicationController
    def index
        @championship = Championship.find_by_id(params[:championship_id])
        @available_drivers = Driver.all - @championship.drivers
    end

    def create
        @championship = Championship.find_by_id(params[:championship_id])
        params[:driver_id].each do |id|
            @championship.drivers <<  Driver.find(id)
        end
        redirect_to :action => 'index', :championship_id => params[:championship_id]
    end
end
