class User < ApplicationRecord
    before_save :downcase_email

    has_many :events, foreign_key: 'creator_id', class_name: 'Event'

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    private
    def downcase_email
        email.downcase!
    end
end
