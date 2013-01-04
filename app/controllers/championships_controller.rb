class ChampionshipsController < ApplicationController
    def new
        @championship = Championship.new
    end

    def index
        @championships = Championship.all
    end

    def show
        @championship = Championship.includes(:rounds => {:roundPositions => :driver }).find(params[:id])

        @ranking = @championship.build_ranking
    end

    def create
        @championship = Championship.create(params[:championship])

        redirect_to :action => :show, :id => @championship.id
    end
end
