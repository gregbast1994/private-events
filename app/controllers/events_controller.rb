class EventsController < ApplicationController
    before_action :require_login

    def show
        @event = Event.find(params[:id])
    end

    private
    def require_login
        unless logged_in?
            flash[:info] = "You must log in first."
            redirect_to login_path
        end
    end
end
