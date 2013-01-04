class RoundsController < ApplicationController
    def new
        @championship = Championship.find(params[:championship_id])
        @round = Round.new
        @available_tracks = Track.all
    end

    def create
        round = Round.new(params[:round].slice(:name, :date))
        round.championship = Championship.find(params[:championship_id])
        round.track = Track.find(params[:round][:track])
        params[:round][:roundPosition].each do |standing|
            roundPosition = round.roundPositions.build(standing[1])
            roundPosition.driver = Driver.find(standing[0])
        end
        round.save

        redirect_to :action => :show, :championship_id => params[:championship_id], :id => round.id
    end

    def show
        @championship = Championship.find(params[:championship_id])
        @round = Round.where(:id => params[:id], :championship_id => params[:championship_id]).first
    end

    def index
        @championship = Championship.find(params[:championship_id])

        @rounds = Round.includes(:track, :roundPositions => [:driver]).where(:championship_id => params[:championship_id], :round_positions => {:position => 1 })
    end
end
