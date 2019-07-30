class User < ApplicationRecord
    before_save :downcase_email

    has_many :events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :rsvps, foreign_key: 'attendee_id'
    
    has_many :attended_events, :through => :rsvps,
                               :source => :attended_event

                               

    has_many :sent_invites, foreign_key: 'sender_id', 
                           class_name: 'Invite'

    has_many :received_invites, foreign_key: 'receiver_id', 
                           class_name: 'Invite'

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    def invite(user, event)
        sent_invites << Invite.new( receiver: user, event: event )
    end

    def has_invite_to?(event)
        ! received_invites.find_by(event: event).nil?
    end

    def reject(invite)
        received_invites.delete(invite)
    end


    def attending?(event)
        attended_events.include?(event)
    end

    def attend(event)
        attended_events << event
    end

    def miss(event)
        attended_events.delete(event)
    end


    private
    def downcase_email
        email.downcase!
    end
end
