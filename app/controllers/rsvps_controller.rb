class RsvpsController < ApplicationController
    before_action :require_login

    def create
        @rsvp = current_user.rsvps.build(attended_event_id: params[:event_id])
        if @rsvp.save
            flash.now[:success] = "Thanks"
        else
            flash.now[:danger] = "Error"
        end
        redirect_back fallback_location: event_path(params[:event_id])
    end

    def update
    end

    def destroy
        @rsvp = current_user.rsvps.find_by(id: params[:id]).delete
        redirect_back fallback_location: root_url
    end

    private
    def rsvp_params
        params.require(:rsvp).permit(:attended_event_id)
    end
end
