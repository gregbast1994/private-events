class Event < ApplicationRecord
    belongs_to :creator,  class_name: 'User'
    has_many :rsvps, foreign_key: 'attended_event_id'
    has_many :attendees, :through => :rsvps,
                         :source => :attendee

    has_many :invites, foreign_key: 'event_id'
    has_many :invited_users, :through => :invites,
    :source => :receiver

    default_scope -> { order(created_at: :desc) }
    scope :past, -> { where("event_date < ?", Time.now) }
    scope :future, -> { where("event_date > ?", Time.now) }

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
