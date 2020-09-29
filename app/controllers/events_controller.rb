class EventsController < ApplicationController



    private
    
    def event_params
        params.require(:event).permit(:location_id, :name)
    end
end
