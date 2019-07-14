class Event < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :when, presence: true
    validates :where, presence: true
    validates :user_id, presence: true

    def datetime
        self.when.strftime("%A, %b %d %Y @ %H:%M %p")
    end
end
