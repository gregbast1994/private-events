class Event < ApplicationRecord
    belongs_to :creator,  class_name: 'User'
    has_many :rsvps, foreign_key: 'attended_event_id'
    has_many :attendees, :through => :rsvps,
                         :source => :attendee
    
    mount_uploader :thumbnail, ThumbnailUploader
    
    validates :title, presence: true
    validates :event_date, presence: true
    validates :location, presence: true
    validates :creator_id, presence: true

    def formatted_date
        self.event_date.strftime("%A, %b %d, %H:%M %p")
    end

    def going?(user)
        self.attendees.find_by(id: user.id)
    end
end
