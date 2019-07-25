class User < ApplicationRecord
    before_save :downcase_email

    has_many :events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :rsvps, foreign_key: 'attendee_id'
    
    has_many :attended_events, :through => :rsvps,
                               :source => :attended_event

    has_many :invitations, foreign_key: 'receiver_id', 
                           class_name: 'Invite'

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    def has_invite_to(event)
        ! self.invitations.where(event: event).nil?
    end

    def invitation_for(event)
        self.invitations.find_by(event: event)
    end

    private
    def downcase_email
        email.downcase!
    end
end
