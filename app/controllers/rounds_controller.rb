class RoundsController < ApplicationController
    def new
        @championship = Championship.find_by_id(params[:championship_id])
        @round = Round.new
        @available_tracks = Track.all
        @drivers = @championship.drivers
    end

    def create
        @round = Round.new(:name => params[:round][:name], :date => params[:round][:date])
        track = Track.find_by_id(params[:round][:track])
        @round.track = track
        @round.save
        params[:round][:roundPosition].each do |standing|
            roundPosition= @round.roundPositions.build(:total_time => standing[1][:total_time], :position => standing[1][:position])
            roundPosition.driver= Driver.find_by_id(standing[0])
            roundPosition.save
        end

        redirect_to :action => :show, :championship_id => params[:championship_id], :id => @round.id
    end

    def show
        @round = Round.find_by_id(params[:id])
        @round_positions = RoundPosition.find_all_by_round_id(params[:id])
    end
end
