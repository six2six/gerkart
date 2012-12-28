class ChampionshipsController < ApplicationController
    def new
        @championship = Championship.new
    end

    def show
        @championship = Championship.find(params[:id])
    end

    def create
        @championship = Championship.new(params[:championship])
        @championship.save

        redirect_to :action => :show, :id => @championship.id
    end
end
