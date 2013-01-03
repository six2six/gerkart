class RankingConfigurationsController < ApplicationController
    def create
        @rankingConfiguration = RankingConfiguration.new(params[:ranking_configuration])
        @rankingConfiguration.championship_id = params[:championship_id]
        @rankingConfiguration.save

        redirect_to :action => 'index'
    end

    def index
        @rankingConfiguration = RankingConfiguration.new
        @championship = Championship.find(params[:championship_id])

        @rankingConfigurations = RankingConfiguration.where(:championship_id => params[:championship_id]).order(:position)
    end

    def destroy
        RankingConfiguration.find(params[:id]).destroy
        redirect_to :action => 'index'
    end
end
