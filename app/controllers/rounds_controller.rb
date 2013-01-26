class RoundsController < ApplicationController
    def new
        @championship = Championship.includes(:drivers).find(params[:championship_id])
        @round = Round.new
        @round.track = Track.new
        @available_tracks = Track.all
        @roundPositions = initialize_roundPositions @championship.drivers
    end

    def initialize_roundPositions drivers
        roundPositions = Array.new
        drivers.each do |driver|
            roundPosition = RoundPosition.new
            roundPosition.driver = driver
            roundPositions << roundPosition
        end
        return roundPositions
    end

    def edit
        @round = Round.includes(:championship, :track, :drivers).find(params[:id])
        @championship = @round.championship
        @roundPositions = @round.roundPositions + initialize_roundPositions(@championship.drivers - @round.drivers)
        @available_tracks = Track.all
    end

    def update
        round = Round.find(params[:id])
        round.name = params[:round][:name]
        round.date = params[:round][:date]
        round.track = Track.find(params[:round][:track])
        Round.transaction do
            RoundPosition.delete_all(:round_id => params[:id])
            create_round_positions round, params
            round.save
        end
        redirect_to :action => :show, :championship_id => params[:championship_id], :id => round.id
    end

    def create
        round = Round.new(params[:round].slice(:name, :date))
        round.championship = Championship.find(params[:championship_id])
        round.track = Track.find(params[:round][:track])
        create_round_positions round, params
        round.save

        redirect_to :action => :show, :championship_id => params[:championship_id], :id => round.id
    end

    def create_round_positions round, params
        params[:round][:roundPositions_attributes].each do |standing|
            if !standing[1][:position].empty?
                roundPosition = round.roundPositions.build(standing[1].slice(:position, :total_time))
                roundPosition.driver = Driver.find(standing[1][:driver_id])
            end
        end
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
