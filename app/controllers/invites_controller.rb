class InvitesController < ApplicationController
    def create
        @receiver = User.find(params[:receiver_id])
        @event = Event.find(params[:event_id])

        @invite = current_user.invite(@receiver, @event)
        respond_to do |format|
            format.html { redirect_to @event }
            format.js
        end
    end

    def destroy
        @invite = Invite.find(params[:id])
        current_user.reject(@invite)
        respond_to do |format|
            format.html { redirect_to @event }
            format.js
        end
    end

    private
    def invite_params
        params.require(:invite).permit(:receiver_id, :event_id)
    end
end
