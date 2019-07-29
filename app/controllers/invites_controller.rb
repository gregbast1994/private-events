class InvitesController < ApplicationController
    def create
        @invite = Invite.new(sender: current_user,
                             receiver_id: params[:receiver_id],
                             event_id: params[:event_id])

        @invite.save ? flash[:success] = 'User invited' : 
                       flash[:danger] = 'Error'
                       
        redirect_to event_path(params[:event_id]) || root_url
    end

    def destroy
        @invite = params[:id]
        @invite.destroy
        redirect_to response.referrers
    end

    private
    def invite_params
        params.require(:invite).permit(:receiver_id, :event_id)
    end
end
