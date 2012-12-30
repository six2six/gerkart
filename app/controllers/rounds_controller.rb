class RoundsController < ApplicationController
    def new
        @championship = Championship.find_by_id(params[:championship_id])
        @round = Round.new
        @available_tracks = Track.all
    end

    def create
        round = Round.new(params[:round].slice(:name, :date))
        round.track = Track.find_by_id(params[:round][:track])
        round.save
        params[:round][:roundPosition].each do |standing|
            roundPosition = round.roundPositions.build(standing[1])
            roundPosition.driver = Driver.find_by_id(standing[0])
            roundPosition.save
        end

        redirect_to :action => :show, :championship_id => params[:championship_id], :id => round.id
    end

    def show
        @round = Round.find_by_id(params[:id])
        @round_positions = RoundPosition.find_all_by_round_id(params[:id])
    end
end
