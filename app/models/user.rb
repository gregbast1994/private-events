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
