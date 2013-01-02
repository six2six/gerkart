class ChampionshipsController < ApplicationController
    def new
        @championship = Championship.new
    end

    def show
        @championship = Championship.includes(:rounds => {:roundPositions => :driver}).find(params[:id])

        conf = Hash[RankingConfiguration.where(:championship_id => params[:id]).all.map {|i| [i.position, i.points]}]
        conf.default = 0
        @ranking = Hash.new
        @championship.rounds.each do |round|
            round.roundPositions.each do |roundPosition|
                name = roundPosition.driver.name
                if  @ranking[name].nil?
                    @ranking[name] = { :points => conf[roundPosition.position], :positions => [roundPosition.position] }
                else
                    @ranking[name][:points] = @ranking[name][:points] + conf[roundPosition.position]
                    @ranking[name][:positions] << roundPosition.position
                end
            end
        end

        @ranking = @ranking.sort_by{|k,v| -v[:points]}
    end

    def create
        @championship = Championship.new(params[:championship])
        @championship.save

        redirect_to :action => :show, :id => @championship.id
    end
end
