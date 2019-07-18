class RsvpsController < ApplicationController
    before_action :require_login
    before_action :not_get_method

    def create
        @rsvp = current_user.rsvps.build(attended_event_id: params[:event_id])
        if @rsvp.save
            flash.now[:success] = "You're going!"
        else
            flash.now[:danger] = "Error"
        end
        redirect_back fallback_location: event_path(params[:event_id])
    end

    def update
    end

    def destroy
    end

    private
    def rsvp_params
        params.require(:rsvp).permit(:attended_event_id)
    end

    def not_get_method
        # redirect_to root_url unless post? || delete? || put?
    end
end
