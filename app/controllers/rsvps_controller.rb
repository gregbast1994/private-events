class RsvpsController < ApplicationController
    before_action :require_login

    def create
        @event = Event.find(params[:attended_event_id])
        current_user.attend(@event)
        redirect_to @event
    end

    def update
    end

    def destroy
        @rsvp = current_user.rsvps.find_by(id: params[:id]).delete
        redirect_back fallback_location: root_url
    end

    private
    def rsvp_params
        params.require(:rsvp).permit(:attended_event)
    end
end
