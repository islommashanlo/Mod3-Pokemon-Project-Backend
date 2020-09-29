class LocationsController < ApplicationController
    before_action :find_loc, only: [:show]

    def index
        locs = Location.all
        render json: locs
    end

    private

    def loc_params
        params.require(:location).permit(:name, :api_id)
    end

    def find_loc
        @loc = Location.find(params[:id])
    end

end
