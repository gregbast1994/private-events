class EventsController < ApplicationController
    before_action :require_login

    def new
        @event = current_user.events.build
    end

    def show
        @event = Event.find(params[:id])
        
        ban_list = @event.attendees + @event.invited_users + [current_user]
        @users = User.where.not(id: ban_list)
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            flash[:success] = "Event posted."
            redirect_to @event
        else
            render 'new'
        end
    end

    private
    def event_params
        params.require(:event).permit(:thumbnail, :title, :event_date,
                                      :location, :description)
    end

end
