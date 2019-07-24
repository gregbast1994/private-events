class InvitesController < ApplicationController
    def create
    end

    private
    def invite_params
        params.require(:invite).permit(:receiver_id, :event_id)
    end
end
