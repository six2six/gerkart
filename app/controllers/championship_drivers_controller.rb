class ChampionshipDriversController < ApplicationController
    def index
        @championship = Championship.includes(:drivers).find(params[:championship_id])
        @available_drivers = Driver.all - @championship.drivers
    end

    def create
        @championship = Championship.find(params[:championship_id])
        @championship.drivers <<  Driver.find(params[:driver_id])
        redirect_to :action => 'index', :championship_id => params[:championship_id]
    end
end
