module RsvpsHelper
    def maybe_delete_invite(invite)
        invite.destroy if invite
    end
end
