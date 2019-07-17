class Event < ApplicationRecord
    belongs_to :user
    has_many :attendees, :class_name => "User"
    
    mount_uploader :thumbnail, ThumbnailUploader
    
    validates :title, presence: true
    validates :event_date, presence: true
    validates :location, presence: true
    validates :user_id, presence: true

    def formatted_date
        self.event_date.strftime("%A, %b %d, %H:%M %p")
    end
end
