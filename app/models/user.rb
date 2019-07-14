class User < ApplicationRecord
    before_save :downcase_email

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    private
    def downcase_email
        email.downcase!
    end
end
