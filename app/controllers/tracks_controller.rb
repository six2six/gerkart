class TracksController < ApplicationController
    def index
        @tracks = Track.all
    end

    def new
        @track = Track.new
    end

    def create
        Track.new(params[:track]).save

        redirect_to :action => :index
    end
end
